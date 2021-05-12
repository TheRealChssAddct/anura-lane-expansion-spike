create or alter view all_products (is_group, group_or_element_name, product_id)
	with schemabinding
	as
		select 0, product_name, product_id
		from dbo.standard_products
		where product_status <> 'exclude'

		union all

		select 1, '', product_id
		from dbo.standard_products
		where product_status <> 'exclude'

		union all

		select 1, group_name, product_id
		from dbo.standard_groups
			join dbo.standard_products on group_member = product_name
		where group_type = 'product'
			and group_status <> 'exclude'
			and product_status <> 'exclude'