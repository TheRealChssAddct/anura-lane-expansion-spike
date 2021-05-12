# Import Test Case

1. Manually set up on SQL SERVER connection to Azure Blob

``` SQL
-- Set up encryption key
create master key encryption by password = '<key>';

-- Create credential to Blob Storage
create database scoped credential AnuraBlobCredential
with identity = 'SHARED ACCESS SIGNATURE',
secret = '?sv=2020-02-10&ss=b&srt=c&sp=rwdlacx&se=2021-05-25T04:17:39Z&st=2021-05-10T20:17:39Z&spr=https&sig=nmtdzSRKcJEsvvofd%2BaYqb356Lv0vybLVm1PRw4IvD4%3D';

-- Create external data source
create external data source AnuraBlob
with (
    type       = blob_storage,
    location   = 'https://anuraspike.blob.core.windows.net/expansion-test',
    credential = AnuraBlobCredential
);
```

1. Loaded easch test case into Anura User tables using load_test.py
