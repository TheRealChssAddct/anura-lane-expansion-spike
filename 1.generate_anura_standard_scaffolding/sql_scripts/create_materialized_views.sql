-- materialized_all_destinations
if object_id('materialized_all_destinations', 'u') is null
begin
    create table materialized_all_destinations (
        is_group int,
        group_or_element_name varchar(500),
        destination_id int
    );
end

drop index if exists materialized_all_destinations.idx_materialized_all_destinations;

create index idx_materialized_all_destinations on materialized_all_destinations (
    group_or_element_name
);

-- materialized_all_modes
if object_id('materialized_all_modes', 'u') is null
begin
    create table materialized_all_modes (
        is_group int,
        group_or_element_name varchar(500),
        mode_id int
    );
end

drop index if exists materialized_all_modes.idx_materialized_all_modes;

create index idx_materialized_all_modes on materialized_all_modes (
    group_or_element_name
);

-- materialized_all_origins
if object_id('materialized_all_origins', 'u') is null
begin
    create table materialized_all_origins (
        is_group int,
        group_or_element_name varchar(500),
        origin_id int
    );
end

drop index if exists materialized_all_origins.idx_materialized_all_origins;

create index idx_materialized_all_origin on materialized_all_origins (
    group_or_element_name
);

-- materialized_all_periods
if object_id('materialized_all_periods', 'u') is null
begin
    create table materialized_all_periods (
        is_group int,
        group_or_element_name varchar(500),
        period_id int
    );
end

drop index if exists materialized_all_periods.idx_materialized_all_periods;

create index idx_materialized_all_periods on materialized_all_periods (
    group_or_element_name
);

-- materialized_all_products
if object_id('materialized_all_products', 'u') is null
begin
    create table materialized_all_products (
        is_group int,
        group_or_element_name varchar(500),
        product_id int
    );
end

drop index if exists materialized_all_products.idx_materialized_all_products;

create index idx_materialized_all_products on materialized_all_products (
    group_or_element_name
);

-- materialized_all_distances
if object_id('materialized_all_distances', 'u') is null
begin
    create table materialized_all_distances (
        origin_id int,
        destination_id int,
        distance float,
        constraint pk_materialized_all_distances primary key (origin_id, destination_id)
    );
end