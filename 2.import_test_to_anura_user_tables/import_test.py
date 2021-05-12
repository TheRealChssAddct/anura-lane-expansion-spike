import pyodbc
import logging
import os
import sys
import time

modulePath = os.path.dirname(__file__)
rootPath = os.path.dirname(modulePath)
scriptPath = f'{modulePath}/sql_scripts'
testCasePath = f'{rootPath}/inputs'

# Such ugly hack to allow import from sibling folder
sys.path.append(rootPath) ## append parent folder to path
import common

logger = common.getLogger(modulePath)
logger.info('Running ' + __file__)

def main():
    try:
        os.system("clear")
        test_cases = []
        test_case_directories = [f.name for f in os.scandir(testCasePath) if f.is_dir()]
        test_case_directories.sort()
        for i, name in enumerate(test_case_directories, start=1):
            test_cases.append(name)
            print("{}: {}".format(i, name))

        test_case_index = input('Choose test case: ')
        test_case = test_cases[int(test_case_index) - 1]

        start_time = time.monotonic()
        logger.info(f'Load inputs for test "{test_case}"')
        csv_files = [f.name for f in os.scandir(f'{testCasePath}/{test_case}') if f.is_file() and f.name.endswith('.csv')]
        for csv_file in csv_files:
            create_table(test_case, csv_file)

        print('seconds: ', time.monotonic() - start_time)

    except Exception as e:
        logger.critical(f'load_inputs exception: {e}')

def create_table(test_case, csv_file):
    create_table_template = common.read_file(f'{scriptPath}/create_table_template.sql')
    drop_table_template = common.read_file(f'{scriptPath}/drop_table_template.sql')
    bulk_insert_template = common.read_file(f'{scriptPath}/bulk_insert_template.sql')
    remove_lf_template = common.read_file(f'{scriptPath}/remove_lf_template.sql')
    columns = common.read_file_line(f'{testCasePath}/{test_case}/{csv_file}')

    columns_sql = f'\t' + columns.replace(f'\n', '').replace(',', f' varchar(255),\n\t') + ' varchar(255)'
    columns_list = columns.split(',')
    last_column_name = columns_list[len(columns_list)-1]

    filename = f'{test_case}/{csv_file}'
    table_name = f'{test_case}_{csv_file}'.replace('.csv', '')
    drop_table_sql = drop_table_template.replace('<<tablename>>', table_name)
    create_table_sql = create_table_template.replace('<<tablename>>', table_name).replace('<<columns>>', columns_sql)
    bulk_insert_sql = bulk_insert_template.replace('<<tablename>>', table_name).replace('<<filename>>', filename)
    remove_lf_sql = remove_lf_template.replace('<<tablename>>', table_name).replace('<<column_name>>', last_column_name)

    with pyodbc.connect(common.connectionString) as conn:
        with conn.cursor() as cursor:
            logger.info(f'dropping table for {csv_file}')
            cursor.execute(drop_table_sql)

            logger.info(f'creating table for {csv_file}')
            cursor.execute(create_table_sql)

            logger.info(f'importing data for {csv_file}')
            cursor.execute(bulk_insert_sql)

            logger.info(f'cleaning data for {csv_file}')
            cursor.execute(remove_lf_sql)

if __name__ == '__main__':
    main()

    logger.info('done')
    logging.shutdown()