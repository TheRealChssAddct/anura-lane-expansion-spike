import pyodbc
import logging
import os
import sys
import time

modulePath = os.path.dirname(__file__)
rootPath = os.path.dirname(modulePath)
scriptsPath = f'{modulePath}/sql_scripts'

# Such ugly hack to allow import from sibling folder
sys.path.append(rootPath) ## append parent folder to path
import common

logger = common.getLogger(modulePath)
logger.info('Running ' + __file__)

def main():
    try:
        os.system("clear")
        start_time = time.monotonic()
        # Create Tables & Materialized Views
        create_tables()

        # Create Views
        create_views()

        # Create Expansion Views
        create_expansion_views()

        # Create Dedupe Views
        # create_dedupe_views()

        print('seconds: ', time.monotonic() - start_time)
    except Exception as e:
        logger.critical(f'The model encountered an exception: {e}')

def create_tables():
    tear_down = common.read_file(f'{scriptsPath}/tear_down.sql')
    create_tables = common.read_file(f'{scriptsPath}/create_tables.sql')
    create_materialized_views = common.read_file(f'{scriptsPath}/create_materialized_views.sql')

    with pyodbc.connect(common.connectionString) as conn:
        with conn.cursor() as cursor:
            logger.info('tear down')
            cursor.execute(tear_down)
            logger.info('create tables')
            cursor.execute(create_tables)
            logger.info('create materialized views')
            cursor.execute(create_materialized_views)

def create_views():
    view_files = [f.name for f in os.scandir(f'{scriptsPath}/views') if f.is_file()]
    view_files.sort()
    for view_file in view_files:
        view_sql = common.read_file(f'{scriptsPath}/views/{view_file}')

        with pyodbc.connect(common.connectionString) as conn:
            with conn.cursor() as cursor:
                logger.info(f'create view {view_file}')
                cursor.execute(view_sql)

def create_expansion_views():
    expanded_lanes_view_v1 = common.read_file(f'{scriptsPath}/expanded_lanes_v1.sql')
    expanded_lanes_view_v2 = common.read_file(f'{scriptsPath}/expanded_lanes_v2.sql')

    with pyodbc.connect(common.connectionString) as conn:
        with conn.cursor() as cursor:
            logger.info('create expansion views')
            cursor.execute(expanded_lanes_view_v1)
            cursor.execute(expanded_lanes_view_v2)

def create_dedupe_views():
    deduped_lanes_view_v1 = common.read_file(f'{scriptsPath}/deduped_lanes_v1.sql')
    deduped_lanes_view_v2 = common.read_file(f'{scriptsPath}/deduped_lanes_v2.sql')

    with pyodbc.connect(common.connectionString) as conn:
        with conn.cursor() as cursor:
            logger.info('create deduped views')
            cursor.execute(deduped_lanes_view_v1)
            cursor.execute(deduped_lanes_view_v2)

if __name__ == '__main__':
    main()

    logger.info('done')
    logging.shutdown()