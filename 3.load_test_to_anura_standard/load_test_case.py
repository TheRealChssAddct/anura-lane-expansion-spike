import pyodbc
import logging
import os
import sys
import time

modulePath = os.path.dirname(__file__)
rootPath = os.path.dirname(modulePath)
scriptsPath = f'{modulePath}/sql_scripts'
testCasesPath = f'{rootPath}/inputs'

# Such ugly hack to allow import from sibling folder
sys.path.append(rootPath) ## append parent folder to path
import common

logger = common.getLogger(modulePath)
logger.info('Running ' + __file__)

def main():
    try:
        os.system("clear")
        test_cases = []
        test_case_directories = [f.name for f in os.scandir(testCasesPath) if f.is_dir()]
        test_case_directories.sort()
        for i, name in enumerate(test_case_directories, start=1):
            test_cases.append(name)
            print("{}: {}".format(i, name))

        test_case_index = input('Choose test case: ')
        test_case = test_cases[int(test_case_index) - 1]

        start_time = time.monotonic()
        logger.info(f'loading test case {test_case}')
        truncate_tables()
        ensure_user_tables(test_case)
        load_test_case(test_case)

        print('seconds: ', time.monotonic() - start_time)
    except Exception as e:
        logger.critical(f'load_test_case exception: {e}')

def truncate_tables():
    truncate_tables_sql = common.read_file(f'{scriptsPath}/truncate_standard_tables.sql')

    with pyodbc.connect(common.connectionString) as conn:
        with conn.cursor() as cursor:
            cursor.execute(truncate_tables_sql)

def ensure_user_tables(test_case):
    ensure_user_tables_template = common.read_file(f'{scriptsPath}/ensure_user_tables_template.sql')

    ensure_user_tables_sql = ensure_user_tables_template.replace('<<test_case>>', test_case)

    with pyodbc.connect(common.connectionString) as conn:
        with conn.cursor() as cursor:
            cursor.execute(ensure_user_tables_sql)

def load_test_case(test_case):
    load_tables_template = common.read_file(f'{scriptsPath}/load_tables_template.sql')
    load_materialized_views = common.read_file(f'{scriptsPath}/load_materialized_views.sql')

    load_tables_sql = load_tables_template.replace('<<test_case>>', test_case)

    with pyodbc.connect(common.connectionString) as conn:
        with conn.cursor() as cursor:
            logger.info('load standard tables')
            cursor.execute(load_tables_sql)
            logger.info('load materialized views')
            cursor.execute(load_materialized_views)

if __name__ == '__main__':
    main()

    logger.info('done')
    logging.shutdown()