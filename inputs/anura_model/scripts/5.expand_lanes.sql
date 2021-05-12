select
    ao.origin_name as expanded_origin_name,
    ad.destination_name as expanded_destination_name,
    am.mode_name as expanded_mode_name,
    all_periods.period_name as expanded_period_name,
    ap.product_name as expanded_product_name,
    coalesce(of.facility_status, os.supplier_status) as origin_status,
    coalesce(df.facility_status, ds.supplier_status, dc.customer_status) as destination_status,
    *
from transportation_lanes t
join all_origins ao on coalese(t.origin_name, '') = coalesce(ao.group_or_element_name, '')
join all_destinations ad on coalesce(t.destination_name, '') = coalesce(ad.group_or_element_name, '')
join all_modes am on coalesce(t.transport_mode, '') = coalesce(am.group_or_element_name, '')
join all_periods on coalesce(t.period_name, '') = coalesce(all_periods.group_or_element_name, '')
join all_products ap on coalesce(t.product_name, '') = coalesce(ap.group_or_element_name, '')
left join customers dc on ad.destination_name = dc.customer_unique_name and ad.destination_type = 'c'
left join facilities df on ad.destination_name = df.facility_unique_name and ad.destination_type = 'f'
left join suppliers ds on ad.destination_name = ds.supplier_unique_name and ad.destination_type = 's'
left join facilities of on ao.origin_name = of.facility_unique_name and ao.origin_type = 'f'
left join suppliers os on ao.origin_name = os.supplier_unique_name and ao.origin_type = 's'
