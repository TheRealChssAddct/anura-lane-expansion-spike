delete from [dbo].[user_<<tablename>>];

bulk insert [dbo].[user_<<tablename>>]
from '<<filename>>'
with (
    data_source = 'AnuraBlob',
    format = 'csv',
    firstrow = 2,
    fieldterminator = ',',
    rowterminator = '0x0a'
);