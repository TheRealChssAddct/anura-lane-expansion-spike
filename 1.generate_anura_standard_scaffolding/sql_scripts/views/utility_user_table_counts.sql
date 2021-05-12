create or alter view user_table_counts (table_name, rows) as
	select
		sys_objects.name,
		sum(stats.row_count)
	from
		sys.objects as sys_objects
		inner join sys.dm_db_partition_stats as stats
				on sys_objects.object_id = stats.object_id
	where
		sys_objects.type = 'u'
		and sys_objects.is_ms_shipped = 0x0
		and stats.index_id < 2
		and sys_objects.name like 'user_%'
	group by
		sys_objects.schema_id,
		sys_objects.name