copy periods
from '/home/chssaddct/code/optilogic/anura/anura_expand_transporation_lanes/inputs/anura_model/periods.csv'
delimiter ','
csv header;

copy facilities
from '/home/chssaddct/code/optilogic/anura/anura_expand_transporation_lanes/inputs/anura_model/facilities.csv'
delimiter ','
csv header;

copy suppliers
from '/home/chssaddct/code/optilogic/anura/anura_expand_transporation_lanes/inputs/anura_model/suppliers.csv'
delimiter ','
csv header;

copy customers
from '/home/chssaddct/code/optilogic/anura/anura_expand_transporation_lanes/inputs/anura_model/customers.csv'
delimiter ','
csv header;

copy products
from '/home/chssaddct/code/optilogic/anura/anura_expand_transporation_lanes/inputs/anura_model/products.csv'
delimiter ','
csv header;

copy transportation_modes
from '/home/chssaddct/code/optilogic/anura/anura_expand_transporation_lanes/inputs/anura_model/transportation_modes.csv'
delimiter ','
csv header;

copy groups
from '/home/chssaddct/code/optilogic/anura/anura_expand_transporation_lanes/inputs/anura_model/groups.csv'
delimiter ','
csv header;

copy transportation_lanes
from '/home/chssaddct/code/optilogic/anura/anura_expand_transporation_lanes/inputs/anura_model/transportation_lanes.csv'
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
select * from transportation_lanes;