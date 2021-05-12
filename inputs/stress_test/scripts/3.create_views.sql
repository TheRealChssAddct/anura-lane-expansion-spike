-- drop materialized view all_periods
create materialized view all_periods (group_or_element_name, period_name)
as
select period_name, period_name from periods
union
select '', period_name from periods
union
select group_name, group_member
from groups join periods on group_member = period_name
where group_type = 'time';

-- drop materialized view all_origins
create materialized view all_origins (group_or_element_name, origin_name, origin_type)
as
select facility_unique_name, facility_unique_name, 'f' from facilities
union
select supplier_unique_name, supplier_unique_name, 's' from suppliers
union
select '', facility_unique_name, 'f' from facilities
union
select '', supplier_unique_name, 's' from suppliers
union
select group_name, group_member, 'f'
from groups join facilities on group_member = facility_unique_name
where group_type = 'location'
union
select group_name, group_member, 's'
from groups join suppliers on group_member = supplier_unique_name
where group_type = 'location';

-- drop materialized view all_destinations
create materialized view all_destinations (group_or_element_name, destination_name, destination_type)
as
select facility_unique_name, facility_unique_name, 'f' from facilities
union
select supplier_unique_name, supplier_unique_name, 's' from suppliers
union
select customer_unique_name, customer_unique_name, 'c' from customers
union
select '', facility_unique_name, 'f' from facilities
union
select '', supplier_unique_name, 's' from suppliers
union
select '', customer_unique_name, 'c' from customers
union
select group_name, group_member, 'f'
from groups join facilities on group_member = facility_unique_name
where group_type = 'location'
union
select group_name, group_member, 's'
from groups join suppliers on group_member = supplier_unique_name
where group_type = 'location'
union
select group_name, group_member, 'c'
from groups join customers on group_member = customer_unique_name
where group_type = 'location';

-- drop materialized view all_products
create materialized view all_products (group_or_element_name, product_name)
as
select product_name, product_name from products
union
select '', product_name from products
union
select group_name, group_member
from groups join products on group_member = product_name
where group_type = 'product';

-- drop materialized view all_modes
create materialized view all_modes (group_or_element_name, mode_name)
as
select mode_name, mode_name from modes
union
select '', mode_name from modes
union
select group_name, group_member
from groups join modes on group_member = mode_name
where group_type = 'mode';

-- drop materialized view all_locations
create materialized view all_locations (latitude, longitude)
as
select customer_latitude, customer_longitude from customers
union distinct
select facility_latitude, facility_longitude from facilities
union distinct
select supplier_latitude, supplier_longitude from suppliers;

-- drop materialized view all_distances
create materialized view all_distances (origin_latitude, origin_longitude, destination_latitude, destination_longitude, distance)
as
select a.latitude, a.longitude, b.latitude, b.longitude,
5000 as d
from all_locations a, all_locations b


select * from all_periods order by group_or_element_name;
select * from all_origins order by group_or_element_name;
select * from all_destinations order by group_or_element_name;
select * from all_products order by group_or_element_name;
select * from all_modes order by group_or_element_name;
select * from all_locations;
select * from all_distances;


refresh materialized view all_periods;
refresh materialized view all_origins;
refresh materialized view all_destinations;
refresh materialized view all_products;
refresh materialized view all_modes;
refresh materialized view all_distances;

