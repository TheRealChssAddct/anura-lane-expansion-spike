create or alter view view_counts (view_name, rows) as
	select 'all_periods' as ViewName, count(*) from all_periods
	union
	select 'all_origins' as ViewName, count(*) from all_origins
	union
	select 'all_destinations' as ViewName, count(*) from all_destinations
	union
	select 'all_products' as ViewName, count(*) from all_products
	union
	select 'all_modes' as ViewName, count(*) from all_modes
	union
	select 'all_destination_points' as ViewName, count(*) from all_destination_points
	union
	select 'all_origin_points' as ViewName, count(*) from all_origin_points