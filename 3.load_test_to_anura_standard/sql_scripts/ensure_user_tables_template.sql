if object_id('user_<<test_case>>_periods', 'u') is null
begin
	create table user_<<test_case>>_periods (
		ID varchar(max),
		period_name varchar(max),
		period_start_date varchar(max),
	);
end;

if object_id('user_<<test_case>>_facilities', 'u') is null
begin
	create table user_<<test_case>>_facilities (
		period_name varchar(max),
		facility_unique_name varchar(255),
		facility_type varchar(max),
		facility_status varchar(max),
		facility_city varchar(max),
		facility_state varchar(max),
		facility_country varchar(max),
		facility_postal_code varchar(max),
		facility_latitude varchar(max),
		facility_longitude varchar(max),
		facility_fixed_operating_cost varchar(max),
		constraint pk_user_<<test_case>>_facilities primary key(facility_unique_name)
	);
end;

if object_id('user_<<test_case>>_suppliers', 'u') is null
begin
	create table user_<<test_case>>_suppliers (
		supplier_status varchar(max),
		period_name varchar(max),
		supplier_unique_name varchar(255),
		supplier_type varchar(max),
		supplier_city varchar(max),
		supplier_state varchar(max),
		supplier_country varchar(max),
		supplier_latitude varchar(max),
		supplier_longitude varchar(max),
		constraint pk_user_<<test_case>>_suppliers primary key(supplier_unique_name)
	);
end;

if object_id('user_<<test_case>>_customers', 'u') is null
begin
	create table user_<<test_case>>_customers (
		period_name varchar(max),
		customer_unique_name varchar(255),
		customer_status varchar(max),
		customer_city varchar(max),
		customer_state varchar(max),
		customer_country varchar(max),
		customer_postal_code varchar(max),
		customer_latitude varchar(max),
		customer_longitude varchar(max),
		constraint pk_user_<<test_case>>_customers primary key(customer_unique_name)
	);
end;

if object_id('user_<<test_case>>_products', 'u') is null
begin
	create table user_<<test_case>>_products (
		period_name varchar(max),
		product_name varchar(255),
		product_status varchar(max),
		product_value varchar(max),
		product_price varchar(max),
		product_weight varchar(max),
		constraint pk_user_<<test_case>>_products primary key(product_name)
	);
end;

if object_id('user_<<test_case>>_groups', 'u') is null
begin
	create table user_<<test_case>>_groups (
		group_status varchar(max),
		group_name varchar(max),
		group_function varchar(max),
		group_type varchar(max),
		group_member varchar(max)
	);
end;

if object_id('user_<<test_case>>_transportation_modes', 'u') is null
begin
	create table user_<<test_case>>_transportation_modes (
		period_name varchar(max),
		mode_name varchar(255),
		mode_status varchar(max),
		constraint pk_user_<<test_case>>_transportation_modes primary key(mode_name)
	);
end;

if object_id('user_<<test_case>>_transportation_lanes', 'u') is null
begin
	create table user_<<test_case>>_transportation_lanes (
		period_name varchar(max),
		origin_name varchar(max),
		destination_name varchar(max),
		product_name varchar(max),
		transport_mode varchar(max),
		lane_status varchar(max),
		mode_selection_rule varchar(max),
		variable_transport_cost varchar(max),
		variable_transport_cost_basis varchar(max),
		transport_time varchar(max),
		transport_time_basis varchar(max),
		distance varchar(max),
		distance_basis varchar(max)
	);
end;