create or alter view all_origin_points (origin_id, origin_latitude, origin_longitude)
	with schemabinding
	as
		select origin_id, facility_latitude, facility_longitude
		from dbo.standard_origins
			join dbo.standard_facilities on origin_source_id = facility_id

		union

		select origin_id, supplier_latitude, supplier_longitude
		from dbo.standard_origins
			join dbo.standard_suppliers on origin_source_id = supplier_id