create or alter view all_destination_points (destination_id, destination_latitude, destination_longitude)
	with schemabinding
	as
		select destination_id, customer_latitude, customer_longitude
		from dbo.standard_destinations
			join dbo.standard_customers on destination_source_id = customer_id
		where destination_source_type = 1

		union

		select destination_id, facility_latitude, facility_longitude
		from dbo.standard_destinations
			join dbo.standard_facilities on destination_source_id = facility_id
		where destination_source_type = 2

		union

		select destination_id, supplier_latitude, supplier_longitude
		from dbo.standard_destinations
			join dbo.standard_suppliers on destination_source_id = supplier_id
		where destination_source_type = 3

