create or alter view all_periods (is_group, group_or_element_name, period_id)
	with schemabinding
	as
		select 0, period_name, period_id
		from dbo.standard_periods

		union all

		select 1, '', period_id
		from dbo.standard_periods

		union all

		select 1, group_name, period_id
		from dbo.standard_groups
			join dbo.standard_periods on group_member = period_name
		where group_type = 'time'
			and group_status <> 'exclude'