create or alter view all_destinations (is_group, group_or_element_name, destination_id)
	with schemabinding
	as
		select 0, destination_name, destination_id
		from dbo.standard_destinations
		join dbo.standard_customers on destination_source_id = customer_id
		where destination_source_type = 1
		and customer_status <> 'exclude'

		union all

		select 0, destination_name, destination_id
		from dbo.standard_destinations
		join dbo.standard_facilities on destination_source_id = facility_id
		where destination_source_type = 2
		and facility_status <> 'exclude'

		union all

		select 0, destination_name, destination_id
		from dbo.standard_destinations
		join dbo.standard_suppliers on destination_source_id = supplier_id
		where destination_source_type = 3
		and supplier_status <> 'exclude'

		union all

		select 1, '', destination_id
		from dbo.standard_destinations
		join dbo.standard_customers on destination_source_id = customer_id
		where destination_source_type = 1
		and customer_status <> 'exclude'

		union all

		select 1, '', destination_id
		from dbo.standard_destinations
		join dbo.standard_facilities on destination_source_id = facility_id
		where destination_source_type = 2
		and facility_status <> 'exclude'

		union all

		select 1, '', destination_id
		from dbo.standard_destinations
		join dbo.standard_suppliers on destination_source_id = supplier_id
		where destination_source_type = 3
		and supplier_status <> 'exclude'

		union all

		select 1, group_name, destination_id
		from dbo.standard_groups
		join dbo.standard_destinations on group_member = destination_name
		join dbo.standard_customers on destination_source_id = customer_id
		where group_type = 'location'
		and group_status <> 'exclude'
		and destination_source_type = 1
		and customer_status <> 'exclude'

		union all

		select 1, group_name, destination_id
		from dbo.standard_groups
		join dbo.standard_destinations on group_member = destination_name
		join dbo.standard_facilities on destination_source_id = facility_id
		where group_type = 'location'
		and group_status <> 'exclude'
		and destination_source_type = 2
		and facility_status <> 'exclude'

		union all

		select 1, group_name, destination_id
		from dbo.standard_groups
		join dbo.standard_destinations on group_member = destination_name
		join dbo.standard_suppliers on destination_source_id = supplier_id
		where group_type = 'location'
		and group_status <> 'exclude'
		and destination_source_type = 3
		and supplier_status <> 'exclude'