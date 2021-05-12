# anura-lane-expansion-spike

Spike using SQL Server to perform the lane expansion from 'Anura User' to 'Anura Expanded'

## The problem

It's been asserted that expanding transportation lanes is of necessity a RBAR problem.  I asserted that SQL is excellent of doing set logic, and ***as described*** the problem sounds like a relational problem that lends itself to set logic.

## Solution

1. Create 'standard' database tables
    - table will exist, even if no entries, el.g., modes
    - tables must have unique keys
1. For each key column, generate a view for all possible (valid) values
    - is all the possible valid entries in the key column
    - columns are:
        - group_or_element_name
        - entity_id,
        - is_group, whether group_or_entity_name is individual (0) or a group name (1) or the special group name of blank (1)
    - union of the following
	    - all entities, where group_or_element_name = entity name (covers individual elements)
	    - all entities, where group_or_element_name = '' (covers 'blank = all')
	    - group expansions, where group_or_element_name is the group name
    - Index the views
    	- can't create indexed views which have union.
    	- alternative is simulate Postgresql's 'Materialized View', which is really just a table that remembers the query to create it, it isn't kept in sync like indexed views, so must be refreshed as needed
1. Import data csv files to 'user' database tables
    - save files to blob storage
    - generate SAS and connection string for blob storage (see https://marczak.io/posts/azure-loading-csv-to-sql/)
    - copy URL of storage container
1. Write a function to perform distance calculations as a prior step
	No need. SQL has native geography support
1. Write a query to perform the expansions, using the indexed views
    - Filter out (remove) any row where lane_status is excluded
    - Joins to all five entity_group views, such that expansion occurs
    - Generates computed columns
        - transport_distanct
        - transport_time
        - variable_transport_cost

## Performance refinements

1. Create an indexed view lookup table which is the cross product of all sites, with the distance pre-calculated.  Then, only have to join to this, rather than perform calculations each time query is run.
