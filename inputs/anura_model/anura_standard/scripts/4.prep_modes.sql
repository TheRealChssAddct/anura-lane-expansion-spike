-- If there are no modes, let's insert each from the lanes.
insert into modes (mode_name)
select distinct transport_mode
from transportation_lanes
left join modes on transport_mode = mode_name
where mode_name is null;

refresh materialized view all_modes;

select * from all_modes order by group_or_element_name;