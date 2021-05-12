DEClARE
@lat decimal(18,15),
@lng decimal(18,15)
SET @lat = 47.639322;
SET @lng = -122.128383;

Declare @source geography = geography::Point(30.20491677226107, -95.45612258030434, 4326);
Declare @destination geography= geography::Point(30.120021042878015, -95.44187468725596, 4326);

Select @source.STDistance(@destination) as Meters
Select @source.STDistance(@destination) / 1000 as Kilometers
Select @source.STDistance(@destination) / 1609.344 as Miles



				product_weight,
				case
						when variable_transport_cost_basis = 'quantity' then
								variable_transport_cost
						when variable_transport_cost_basis = 'quantity-distance' then
								variable_transport_cost * geography::Point(coalesce(o_f.facility_latitude, o_s.supplier_latitude), coalesce(o_f.facility_longitude, o_s.supplier_longitude), 4326).STDistance(geography::Point(coalesce(d_f.facility_latitude, d_s.supplier_latitude, d_c.customer_latitude), coalesce(d_f.facility_longitude, d_s.supplier_longitude, d_c.customer_longitude), 4326)) / 1000
						when variable_transport_cost_basis = 'weight-distance' then
								variable_transport_cost * product_weight* geography::Point(coalesce(o_f.facility_latitude, o_s.supplier_latitude), coalesce(o_f.facility_longitude, o_s.supplier_longitude), 4326).STDistance(geography::Point(coalesce(d_f.facility_latitude, d_s.supplier_latitude, d_c.customer_latitude), coalesce(d_f.facility_longitude, d_s.supplier_longitude, d_c.customer_longitude), 4326)) / 1000
				end as variable_transport_cost_new,
				--coalesce(o_f.facility_latitude, o_s.supplier_latitude) as origin_latitude,
				--coalesce(o_f.facility_longitude, o_s.supplier_longitude) as origin_longitude,
				--coalesce(d_f.facility_latitude, d_s.supplier_latitude, d_c.customer_latitude) as destination_latitude,
				--coalesce(d_f.facility_longitude, d_s.supplier_longitude, d_c.customer_longitude) as destination_longitude,
				--geography::Point(coalesce(o_f.facility_latitude, o_s.supplier_latitude), coalesce(o_f.facility_longitude, o_s.supplier_longitude), 4326) as origin_point,
				--geography::Point(coalesce(d_f.facility_latitude, d_s.supplier_latitude, d_c.customer_latitude), coalesce(d_f.facility_longitude, d_s.supplier_longitude, d_c.customer_longitude), 4326) as destination_point,
				--geography::Point(coalesce(o_f.facility_latitude, o_s.supplier_latitude), coalesce(o_f.facility_longitude, o_s.supplier_longitude), 4326).STDistance(geography::Point(coalesce(d_f.facility_latitude, d_s.supplier_latitude, d_c.customer_latitude), coalesce(d_f.facility_longitude, d_s.supplier_longitude, d_c.customer_longitude), 4326)) / 1000 as distance
				case
						when distance is not null then
								distance
						when distance is null then
								geography::Point(coalesce(o_f.facility_latitude, o_s.supplier_latitude), coalesce(o_f.facility_longitude, o_s.supplier_longitude), 4326).STDistance(geography::Point(coalesce(d_f.facility_latitude, d_s.supplier_latitude, d_c.customer_latitude), coalesce(d_f.facility_longitude, d_s.supplier_longitude, d_c.customer_longitude), 4326)) / 1000
				end as distance


left join dbo.standard_customers d_c on a_d.destination_name = d_c.customer_unique_name and a_d.destination_type = 'c'
		left join dbo.standard_facilities d_f on a_d.destination_name = d_f.facility_unique_name and a_d.destination_type = 'f'
		left join dbo.standard_suppliers d_s on a_d.destination_name = d_s.supplier_unique_name and a_d.destination_type = 's'
		left join dbo.standard_facilities o_f on a_o.origin_name = o_f.facility_unique_name and a_o.origin_type = 'f'
		left join dbo.standard_suppliers o_s on a_o.origin_name = o_s.supplier_unique_name and a_o.origin_type = 's'
		left join dbo.standard_products s_p on s_p.product_name = a_p.product_name





case
						when variable_transport_cost_basis = 'quantity' then
								variable_transport_cost
						when variable_transport_cost_basis = 'quantity-distance' then
								variable_transport_cost * m_a_d.distance
						when variable_transport_cost_basis = 'weight-distance' then
								variable_transport_cost * product_weight * m_a_d.distance
				end as variable_transport_cost_new,
				case
						when t.distance is not null then
								t.distance
						when t.distance is null then
								m_a_d.distance
				end as distance



left join dbo.materialized_all_distances m_a_d on a_o.origin_name = m_a_d.origin_name and a_d.destination_name = m_a_d.destination_name