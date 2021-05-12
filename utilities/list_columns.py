import os
from os.path import dirname as dir

rootPath = dir(dir(__file__))

modulePath = dir(__file__)
testCasePath = f'{rootPath}/inputs'

table_names = ['periods', 'facilities', 'suppliers', 'customers', 'products', 'groups', 'transportation_modes', 'transportation_lanes']

test_cases = []
test_case_directories = [f.name for f in os.scandir(testCasePath) if f.is_dir()]
for table_name in table_names:
    print(table_name)
    for test_case in test_case_directories:
        filename = f'{testCasePath}/{test_case}/{table_name}.csv'
        if os.path.exists(filename):
            with open(filename, 'r') as file:
                columns = file.readline()
            print(f'{columns}: {test_case}')
    print('')

