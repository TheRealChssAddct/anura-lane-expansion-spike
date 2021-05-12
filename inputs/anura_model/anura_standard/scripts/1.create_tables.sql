create table periods (
	period_name varchar(255),
	period_start_date varchar(255)
);

create table facilities (
	period_name varchar(255),
	facility_unique_name varchar(255),
	facility_type varchar(255),
	facility_status varchar(255),
	facility_fixed_operating_cost varchar(255),
	site_role varchar(255),
	primary key(facility_unique_name)
);

create table suppliers (
	period_name varchar(255),
	source_name varchar(255),
	supplier_type varchar(255),
	supplier_status varchar(255),
	site_role varchar(255),
	supplier_fixed_operating_cost varchar(255)
);

create table customers (
	period_name varchar(255),
	customer_unique_name varchar(255),
	customer_status varchar(255),
	primary key(customer_unique_name)
);

create table products (
	product_name varchar(255),
	product_value varchar(255),
	product_price varchar(255),
	primary key(product_name)
);

create table transportation_modes (
	period_name varchar(255),
	mode_name varchar(255),
	mode_status varchar(255)
);

create table groups (
	group_name varchar(255),
	group_member varchar(255),
	group_function varchar(255),
	group_type varchar(255)
);

create table modes (
	mode_name varchar(255),
	mode_status varchar(255)
);

create table sites (
	period_name varchar(255),
	site_name varchar(255),
	sites_type varchar(255),
	sites_status varchar(255),
	fixed_operating_cost varchar(255),
	site_role varchar(255),
	primary key(site_name)
);

create table transportation_lanes (
	origin_name varchar(255),
	destination_name varchar(255),
	product_name varchar(255),
	transport_mode varchar(255),
	period_name varchar(255),
	variable_transport_cost varchar(255),
	transport_time varchar(255),
	distance varchar(255)
);

