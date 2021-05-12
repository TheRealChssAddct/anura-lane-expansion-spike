create or alter view all_modes (is_group, group_or_element_name, mode_id)
	with schemabinding
	as
		select 0, mode_name, mode_id
		from dbo.standard_transportation_modes
		where mode_status <> 'exclude'

		union all

		select 1, '', mode_id
		from dbo.standard_transportation_modes
		where mode_status <> 'exclude'

		union all

		select 1, group_name, mode_id
		from dbo.standard_groups
		join dbo.standard_transportation_modes on group_member = mode_name
		where group_type = 'mode'
			and group_status <> 'exclude'
			and mode_status <> 'exclude'
