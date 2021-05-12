create or alter view expanded_lanes_v1 (
	origin_id,
	destination_id,
	mode_id,
	period_id,
	product_id,
	lane_id,
	count_of_groups,
	computed_distance,
	product_weight
)
with schemabinding
as
	select
		-- expanded key columns
		a_o.origin_id,
		a_d.destination_id,
		a_m.mode_id,
		a_t.period_id,
		a_p.product_id,
		t.lane_id,
		a_o.is_group + a_d.is_group + a_m.is_group + a_t.is_group + a_p.is_group as count_of_groups,
		m_a_d.distance as computed_distance,
		p.product_weight
	from dbo.standard_transportation_lanes t
	join dbo.all_origins a_o on t.origin_name = a_o.group_or_element_name
	join dbo.all_destinations a_d on t.destination_name = a_d.group_or_element_name
	join dbo.all_modes a_m on t.transport_mode = a_m.group_or_element_name
	join dbo.all_periods a_t on t.period_name = a_t.group_or_element_name
	join dbo.all_products a_p on t.product_name = a_p.group_or_element_name
	join dbo.materialized_all_distances m_a_d on a_o.origin_id = m_a_d.origin_id and a_d.destination_id = m_a_d.destination_id
	join dbo.standard_products p on a_p.product_id = p.product_id
	where lane_status <> 'exclude'