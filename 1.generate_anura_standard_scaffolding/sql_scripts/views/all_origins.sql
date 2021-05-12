create or alter view all_origins (is_group, group_or_element_name, origin_id)
	with schemabinding
	as
		select 0, origin_name, origin_id
	from dbo.standard_origins
		join dbo.standard_facilities on origin_source_id = facility_id
	where origin_source_type = 2
		and facility_status <> 'exclude'

	union all

	select 0, origin_name, origin_id
	from dbo.standard_origins
		join dbo.standard_suppliers on origin_source_id = supplier_id
	where origin_source_type = 3
		and supplier_status <> 'exclude'

	union all

	select 1, '', origin_id
	from dbo.standard_origins
		join dbo.standard_facilities on origin_source_id = facility_id
	where origin_source_type = 2
		and facility_status <> 'exclude'

	union all

	select 1, '', origin_id
	from dbo.standard_origins
		join dbo.standard_suppliers on origin_source_id = supplier_id
	where origin_source_type = 3
		and supplier_status <> 'exclude'

	union all

	select 1, group_name, origin_id
	from dbo.standard_groups
		join dbo.standard_origins on group_member = origin_name
		join dbo.standard_facilities on origin_source_id = facility_id
	where group_type = 'location'
		and group_status <> 'exclude'
		and origin_source_type = 2
		and facility_status <> 'exclude'

	union all

	select 1, group_name, origin_id
	from dbo.standard_groups
		join dbo.standard_origins on group_member = origin_name
		join dbo.standard_suppliers on origin_source_id = supplier_id
	where group_type = 'location'
		and group_status <> 'exclude'
		and origin_source_type = 3
		and supplier_status <> 'exclude'