create or alter view deduped_lanes_v1 (
	origin_name,
	destination_name,
	mode_name,
	period_name,
	product_name,

	mode_selection_rule,
	variable_transport_cost,
	variable_transport_cost_basis,
	transport_time,
	transport_time_basis,
	distance,
	distance_basis,
	origin_type,
	destination_type
)
with schemabinding
as
	select distinct origin_name, destination_name, mode_name, period_name, product_name,
		mode_selection_rule = first_value(mode_selection_rule) over (partition by origin_name, destination_name, mode_name, period_name, product_name order by mode_selection_rule_rollup asc rows between unbounded preceding and unbounded following),
		variable_transport_cost = first_value(variable_transport_cost) over (partition by origin_name, destination_name, mode_name, period_name, product_name order by variable_transport_cost_rollup asc rows between unbounded preceding and unbounded following),
		variable_transport_cost_basis = first_value(variable_transport_cost_basis) over (partition by origin_name, destination_name, mode_name, period_name, product_name order by variable_transport_cost_basis_rollup asc rows between unbounded preceding and unbounded following),
		transport_time = first_value(transport_time) over (partition by origin_name, destination_name, mode_name, period_name, product_name order by transport_time_rollup asc rows between unbounded preceding and unbounded following),
		transport_time_basis = first_value(transport_time_basis) over (partition by origin_name, destination_name, mode_name, period_name, product_name order by transport_time_basis_rollup asc rows between unbounded preceding and unbounded following),
		distance = first_value(distance) over (partition by origin_name, destination_name, mode_name, period_name, product_name order by distance_rollup asc rows between unbounded preceding and unbounded following),
		distance_basis = first_value(distance_basis) over (partition by origin_name, destination_name, mode_name, period_name, product_name order by distance_basis_rollup asc rows between unbounded preceding and unbounded following),
		origin_type,
		destination_type
	from dbo.expanded_lanes_v1