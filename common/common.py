import logging
import sys
import datetime as dt

driver= '{ODBC Driver 17 for SQL Server}'
server = 'tcp:anura.database.windows.net'
database = 'lane-expansion-spike'
username = 'anura'
password = 'feelinFroggy81'
connectionString = f'DRIVER={driver};SERVER={server},1433;DATABASE={database};UID={username};PWD={password};Encrypt=yes;TrustServerCertificate=no;Connection Timeout=30;'

# ---------------------------------------------
# Logger Usage
#
# logger.debug('a debug log entry')
# logger.info('an info log entry')
# logger.warning('a warning log entry')
# logger.error('an error log entry')
# logger.critical('a critical log entry')
#
# for more on logging, see https://docs.python.org/3/howto/logging-cookbook.html
# ---------------------------------------------

def getLogger(modulePath):
    logPath = f'{modulePath}/logs'
    logFilename = f'{logPath}/{dt.datetime.now()}.log'

    logger = logging.getLogger('main') # create the parent logger.
    logger.setLevel(logging.DEBUG)

    # Log to file
    fileFormatter = logging.Formatter(fmt='%(asctime)s %(name)s %(levelname)-8s %(message)s')
    file_handler = logging.FileHandler(logFilename, mode='w')
    file_handler.setFormatter(fileFormatter)
    logger.addHandler(file_handler)

    # log to terminal
    screenFormatter = logging.Formatter(fmt='%(asctime)s %(levelname)-8s %(message)s')
    screen_handler = logging.StreamHandler(stream=sys.stdout)
    screen_handler.setFormatter(screenFormatter)
    logger.addHandler(screen_handler) # Comment out this line to not log to the screen

    return logger

def read_file(filepath):
    file_contents = ''
    with open(filepath, 'r') as file:
        file_contents = file.read()

    return file_contents

def read_file_line(filepath):
    file_contents = ''
    with open(filepath, 'r') as file:
        file_contents = file.readline()

    return file_contents


if __name__ == '__main__':
    print(__name__)