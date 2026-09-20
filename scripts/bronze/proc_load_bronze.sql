create or alter procedure bronze.load_bronze as

begin
	declare
		@start_time datetime,
		@end_time datetime 
	
	begin try
		
		print '=====================================';
		print 'Loading Bronze Layer';
		print '=====================================';


		print '=====================================';
		print 'Loading CRM Tables';
		print '=====================================';
		

		set @start_time = getdate();

		truncate table bronze.crm_cust_info;

		bulk insert bronze.crm_cust_info
		from 
		'F:\Data Project\data warehouse project data-material\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		with(	
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);

		set @end_time = getdate();
		print 'date duration ' + cast(datediff(second, @start_time, @end_time) AS nvarchar) + ' seconds';



		set @start_time = getdate();
		truncate table bronze.crm_prd_info;

		bulk insert bronze.crm_prd_info
		from 
		'F:\Data Project\data warehouse project data-material\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		with( 
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);

		set @end_time = getdate();
		print 'date duration ' + cast(datediff(second, @start_time, @end_time) AS nvarchar) + ' seconds';



		set @start_time = getdate();
		truncate table bronze.crm_sales_details;

		bulk insert bronze.crm_sales_details
		from 
		'F:\Data Project\data warehouse project data-material\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		with( 
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);

		set @end_time = getdate();
		print 'date duration ' + cast(datediff(second, @start_time, @end_time) AS nvarchar) + ' seconds';

		print '=====================================';
		print 'Loading ERP Tables';
		print '=====================================';	


		set @start_time = getdate();
		truncate table bronze.erp_cust_az12;

		bulk insert bronze.erp_cust_az12
		from 
		'F:\Data Project\data warehouse project data-material\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
		with( 
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);

		set @end_time = getdate();
		print 'date duration ' + cast(datediff(second, @start_time, @end_time) AS nvarchar) + ' seconds';



		set @start_time = getdate();
		truncate table bronze.erp_loc_a101;

		bulk insert bronze.erp_loc_a101
		from 
		'F:\Data Project\data warehouse project data-material\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
		with( 
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);
		set @end_time = getdate();
		print 'date duration ' + cast(datediff(second, @start_time, @end_time) AS nvarchar) + ' seconds';


		set @start_time = getdate();
		truncate table bronze.erp_px_cat_g1v2;

		bulk insert bronze.erp_px_cat_g1v2
		from 
		'F:\Data Project\data warehouse project data-material\sql-data-warehouse-project\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
		with( 
			firstrow = 2,
			fieldterminator = ',',
			tablock
		);

		set @end_time = getdate();
		print 'date duration ' + cast(datediff(second, @start_time, @end_time) AS nvarchar) + ' seconds';

		end try

		begin catch
			print 'error during load the bronze layer';
			print 'Error Msg' + error_message();
			print 'Error Msg' + cast(error_number() AS NVARCHAR);
			print 'Error Msg' + cast(error_state() AS NVARCHAR); 
		end catch
end
