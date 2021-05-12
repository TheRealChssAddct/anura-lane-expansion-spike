-- views
drop view if exists deduped_lanes_v1;
drop view if exists deduped_lanes_v2;
drop view if exists expanded_lanes_v1;
drop view if exists expanded_lanes_v2;

drop view if exists all_periods;
drop view if exists all_origins;
drop view if exists all_destinations;
drop view if exists all_products;
drop view if exists all_modes;
drop view if exists all_origin_points;
drop view if exists all_destination_points;

-- tables
drop table if exists standard_periods;
drop table if exists standard_facilities;
drop table if exists standard_suppliers;
drop table if exists standard_customers;
drop table if exists standard_products;
drop table if exists standard_groups;
drop table if exists standard_transportation_modes;
drop table if exists standard_transportation_lanes;
drop table if exists standard_origins
drop table if exists standard_destinations

-- 'materialized view' tables
drop table if exists materialized_all_periods;
drop table if exists materialized_all_origins;
drop table if exists materialized_all_destinations;
drop table if exists materialized_all_products;
drop table if exists materialized_all_modes;
drop table if exists materialized_all_distances;