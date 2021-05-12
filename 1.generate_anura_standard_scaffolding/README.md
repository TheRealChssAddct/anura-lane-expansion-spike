# Creating a new Anura Database

Eventually, every new Anura account will get their individual Anura database.

And, eventually, the SQL Server "model database" will contain all the default scaffolding of the Anura DB -- tables, views, indexes, functions, procedures, etc.

At that time, creating a new instance of an Anura DB will be as simple as calling 'create database <customer-account-id-or-some-such>'

Until then, a blank database must be created manually (e.g., via portal, cli, powershell) and then this script is run to generate all the default Anura scaffolding.
