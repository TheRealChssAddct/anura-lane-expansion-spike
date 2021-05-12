insert into standard_origins
select facility_unique_name, 2, facility_id from standard_facilities
union all
select supplier_unique_name, 3, supplier_id from standard_suppliers

insert into standard_destinations
select customer_unique_name, 1, customer_id from standard_customers
union all
select facility_unique_name, 2, facility_id from standard_facilities
union all
select supplier_unique_name, 3, supplier_id from standard_suppliers

insert into materialized_all_periods
select * from all_periods;

insert into materialized_all_origins
select * from all_origins;

insert into materialized_all_destinations
select * from all_destinations;

insert into materialized_all_products
select * from all_products;

insert into materialized_all_modes
select * from all_modes;

insert into materialized_all_distances
select origin_id,
    destination_id,
    geography::Point(origin_latitude, origin_longitude, 4326).STDistance(geography::Point(destination_latitude, destination_longitude, 4326)) / 1000  as distance
from all_origin_points, all_destination_points