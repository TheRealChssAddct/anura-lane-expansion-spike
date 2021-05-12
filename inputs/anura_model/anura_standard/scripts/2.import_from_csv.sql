copy periods
from '/home/gandolt/code/optilogic/anura/anura_expand_transporation_lanes/inputs/anura_standard/periods.csv'
delimiter ','
csv header;

copy facilities
from '/home/gandolt/code/optilogic/anura/anura_expand_transporation_lanes/inputs/anura_standard/facilities.csv'
delimiter ','
csv header;

copy suppliers
from '/home/gandolt/code/optilogic/anura/anura_expand_transporation_lanes/inputs/anura_standard/suppliers.csv'
delimiter ','
csv header;

copy customers
from '/home/gandolt/code/optilogic/anura/anura_expand_transporation_lanes/inputs/anura_standard/customers.csv'
delimiter ','
csv header;

copy products
from '/home/gandolt/code/optilogic/anura/anura_expand_transporation_lanes/inputs/anura_standard/products.csv'
delimiter ','
csv header;

copy transportation_modes
from '/home/gandolt/code/optilogic/anura/anura_expand_transporation_lanes/inputs/anura_standard/transportation_modes.csv'
delimiter ','
csv header;

copy groups
from '/home/gandolt/code/optilogic/anura/anura_expand_transporation_lanes/inputs/anura_standard/groups.csv'
delimiter ','
csv header;

copy sites
from '/home/gandolt/code/optilogic/anura/anura_expand_transporation_lanes/inputs/anura_standard/sites.csv'
delimiter ','
csv header;

copy transportation_lanes
from '/home/gandolt/code/optilogic/anura/anura_expand_transporation_lanes/inputs/anura_standard/transportation_lanes.csv'
delimiter ','
csv header;

select * from periods;
select * from facilities;
select * from groups;
select * from suppliers;
select * from customers;
select * from products;
select * from transportation_modes;
select * from modes;
select * from groups;
select * from sites;
select * from transportation_lanes;