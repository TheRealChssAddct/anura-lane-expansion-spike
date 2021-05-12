create table periods (
	period_name varchar(255),
	period_start_date varchar(255)
);

create table facilities (
	facility_status varchar(255),
	period_name varchar(255),
	facility_unique_name varchar(255),
	facility_type varchar(255),
	facility_city varchar(255),
	facility_state varchar(255),
	facility_country varchar(255),
	facility_postal_code varchar(255),
	facility_latitude varchar(255),
	facility_longitude varchar(255),
	facility_fixed_operating_cost varchar(255),
	primary key(facility_unique_name)
);

create table suppliers (
	supplier_status varchar(255),
	period_name varchar(255),
	supplier_unique_name varchar(255),
	supplier_type varchar(255),
	supplier_city varchar(255),
	supplier_state varchar(255),
	supplier_country varchar(255),
	supplier_latitude varchar(255),
	supplier_longitude varchar(255),
	primary key(supplier_unique_name)
);

create table customers (
	customer_status varchar(255),
	period_name varchar(255),
	customer_unique_name varchar(255),
	customer_city varchar(255),
	customer_state varchar(255),
	customer_country varchar(255),
	customer_postal_code varchar(255),
	customer_latitude varchar(255),
	customer_longitude varchar(255),
	primary key(customer_unique_name)
);

create table products (
	product_status varchar(255),
	product_active_period varchar(255),
	product_name varchar(255),
	product_value varchar(255),
	product_price varchar(255),
	product_weight varchar(255),
	product_cube varchar(255),
	primary key(product_name)
);

create table transportation_modes (
	mode_status varchar(255),
	period_name varchar(255),
	mode_name varchar(255)
);

create table groups (
	group_name varchar(255),
	group_type varchar(255),
	group_class varchar(255),
	group_member varchar(255),
	group_function varchar(255)
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
	lane_status varchar(255),
	period_name varchar(255),
	origin_name varchar(255),
	destination_name varchar(255),
	product_name varchar(255),
	transport_mode varchar(255),
	mode_selection_rule varchar(255),
	variable_transport_cost varchar(255),
	variable_transport_cost_basis varchar(255),
	shipment_size varchar(255),
	shipment_size_basis varchar(255),
	transport_time varchar(255),
	transport_time_basis varchar(255),
	distance varchar(255),
	distance_basis varchar(255)
);

