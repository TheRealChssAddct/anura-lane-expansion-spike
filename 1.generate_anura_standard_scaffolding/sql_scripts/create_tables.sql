if object_id('standard_periods', 'u') is null
begin
	create table standard_periods (
		period_id int identity(1,1),
		ID varchar(max),
		period_name varchar(max),
		period_start_date varchar(max),
	);
end;

if object_id('standard_facilities', 'u') is null
begin
	create table standard_facilities (
		facility_id int identity(1,1),
		period_name varchar(max),
		facility_unique_name varchar(255),
		facility_type varchar(max),
		facility_status varchar(max),
		facility_city varchar(max),
		facility_state varchar(max),
		facility_country varchar(max),
		facility_postal_code varchar(max),
		facility_latitude decimal(18,15),
		facility_longitude decimal(18,15),
		facility_fixed_operating_cost varchar(max),
		constraint pk_standard_facilities primary key(facility_unique_name)
	);
end;

if object_id('standard_suppliers', 'u') is null
begin
	create table standard_suppliers (
		supplier_id int identity(1,1),
		supplier_status varchar(max),
		period_name varchar(max),
		supplier_unique_name varchar(255),
		supplier_type varchar(max),
		supplier_city varchar(max),
		supplier_state varchar(max),
		supplier_country varchar(max),
		supplier_latitude decimal(18,15),
		supplier_longitude decimal(18,15),
		constraint pk_standard_suppliers primary key(supplier_unique_name)
	);
end;

if object_id('standard_customers', 'u') is null
begin
	create table standard_customers (
		customer_id int identity(1,1),
		period_name varchar(max),
		customer_unique_name varchar(255),
		customer_status varchar(max),
		customer_city varchar(max),
		customer_state varchar(max),
		customer_country varchar(max),
		customer_postal_code varchar(max),
		customer_latitude decimal(18,15),
		customer_longitude decimal(18,15),
		constraint pk_standard_customers primary key(customer_unique_name)
	);
end;

if object_id('standard_products', 'u') is null
begin
	create table standard_products (
		product_id int identity(1,1),
		period_name varchar(max),
		product_name varchar(255),
		product_status varchar(max),
		product_value varchar(max),
		product_price varchar(max),
		product_weight decimal(18,10),
		constraint pk_standard_products primary key(product_name)
	);
end;

if object_id('standard_groups', 'u') is null
begin
	create table standard_groups (
		group_id int identity(1,1),
		group_status varchar(max),
		group_name varchar(max),
		group_function varchar(max),
		group_type varchar(max),
		group_member varchar(max)
	);
end;

if object_id('standard_transportation_modes', 'u') is null
begin
	create table standard_transportation_modes (
		mode_id int identity(1,1),
		period_name varchar(max),
		mode_name varchar(255),
		mode_status varchar(max),
		constraint pk_standard_transportation_modes primary key(mode_name)
	);
end;

if object_id('standard_transportation_lanes', 'u') is null
begin
	create table standard_transportation_lanes (
		lane_id int identity(1,1),
		period_name varchar(max),
		origin_name varchar(max),
		destination_name varchar(max),
		product_name varchar(max),
		transport_mode varchar(max),
		lane_status varchar(max),
		mode_selection_rule varchar(max),
		variable_transport_cost float,
		variable_transport_cost_basis varchar(max),
		transport_time float,
		transport_time_basis varchar(max),
		distance float,
		distance_basis varchar(max)
	);
end;

if object_id('standard_origins', 'u') is null
begin
	create table standard_origins (
		origin_id int identity(1,1),
		origin_name varchar(max),
		origin_source_type int, -- 2=facilities, 3=suppliers
		origin_source_id int
	);
end;

if object_id('standard_destinations', 'u') is null
begin
	create table standard_destinations (
		destination_id int identity(1,1),
		destination_name varchar(max),
		destination_source_type int, -- 1=customers 2=facilities, 3=suppliers
		destination_source_id int
	);
end;