truncate transportation_lanes;
copy transportation_lanes
from '/home/gandolt/code/optilogic/anura/anura_expand_transporation_lanes/inputs/anura_standard/transportation_lanes_test.csv'
delimiter ','
csv header;

select * from transportation_lanes;

/*

select * from all_periods order by group_or_element_name;
select * from all_origins order by group_or_element_name;
select * from all_destinations order by group_or_element_name;
select * from all_products order by group_or_element_name;
select * from all_modes order by group_or_element_name;

*/