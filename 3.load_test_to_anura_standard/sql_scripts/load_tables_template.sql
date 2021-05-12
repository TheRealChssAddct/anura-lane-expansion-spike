insert into standard_periods (ID,period_name,period_start_date)
select ID,period_name,period_start_date
from user_<<test_case>>_periods
where period_name is not null and period_name <> '';


insert into standard_facilities (period_name,facility_unique_name,facility_type,facility_status,facility_city,facility_state,facility_country,facility_postal_code,facility_latitude,facility_longitude,facility_fixed_operating_cost)
select period_name,facility_unique_name,facility_type,facility_status,facility_city,facility_state,facility_country,facility_postal_code,facility_latitude,facility_longitude,facility_fixed_operating_cost
from user_<<test_case>>_facilities
where facility_unique_name is not null and facility_unique_name <> '';

update standard_facilities set facility_status = '' where facility_status is null

insert into standard_suppliers (supplier_status,period_name,supplier_unique_name,supplier_type,supplier_city,supplier_state,supplier_country,supplier_latitude,supplier_longitude)
select supplier_status,period_name,supplier_unique_name,supplier_type,supplier_city,supplier_state,supplier_country,supplier_latitude,supplier_longitude
from user_<<test_case>>_suppliers
where supplier_unique_name is not null and supplier_unique_name <> '';

update standard_suppliers set supplier_status = '' where supplier_status is null

insert into standard_customers (period_name,customer_unique_name,customer_status,customer_city,customer_state,customer_country,customer_postal_code,customer_latitude,customer_longitude)
select period_name,customer_unique_name,customer_status,customer_city,customer_state,customer_country,customer_postal_code,customer_latitude,customer_longitude
from user_<<test_case>>_customers
where customer_unique_name is not null and customer_unique_name <> '';

update standard_customers set customer_status = '' where customer_status is null

insert into standard_products (period_name,product_name,product_status,product_value,product_price,product_weight)
select period_name,product_name,product_status,product_value,product_price,product_weight
from user_<<test_case>>_products
where product_name is not null and product_name <> '';

update standard_products set product_status = '' where product_status is null

insert into standard_groups (group_status,group_name,group_function,group_type,group_member)
select group_status,group_name,group_function,group_type,group_member
from user_<<test_case>>_groups
where group_name is not null and group_name <> '';

update standard_groups set group_status = '' where group_status is null

insert into standard_transportation_modes (period_name,mode_name,mode_status)
select period_name,mode_name,mode_status
from user_<<test_case>>_transportation_modes
where mode_name is not null and mode_name <> '';

update standard_transportation_modes set mode_status = '' where mode_status is null

insert into standard_transportation_lanes (period_name,origin_name,destination_name,product_name,transport_mode,lane_status,mode_selection_rule,variable_transport_cost,variable_transport_cost_basis,transport_time,transport_time_basis,distance,distance_basis)
select period_name,origin_name,destination_name,product_name,transport_mode,lane_status,mode_selection_rule,variable_transport_cost,variable_transport_cost_basis,transport_time,transport_time_basis,distance,distance_basis
from user_<<test_case>>_transportation_lanes;

update standard_transportation_lanes set lane_status = '' where lane_status is null
update standard_transportation_lanes set period_name = '' where period_name is null
update standard_transportation_lanes set destination_name = '' where destination_name is null
update standard_transportation_lanes set origin_name = '' where origin_name is null
update standard_transportation_lanes set product_name = '' where product_name is null
update standard_transportation_lanes set transport_mode = '' where transport_mode is null

if not exists (select top 1 * from standard_transportation_modes)
begin
insert into standard_transportation_modes (mode_name, mode_status)
    select distinct coalesce(nullif(transport_mode, ''), '<<no_modes>>'), '' from standard_transportation_lanes
end
