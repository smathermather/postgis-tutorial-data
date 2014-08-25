Background:
	* We will be loading data from a zipped shapefile, a specialized geographic format that is a formal and defacto data standard, and quite common. The dataset itself is ????.
	* In this exercise, we will be using PostGIS as storage medium for the data and view those data using QGIS, a desktop GIS platform.

Let's load some data:
	* First we will load our dataset.
		*Choose the "Add Vector Layer" button from the "Manage Layers" toolbar.
		* Choose "Browse"
		* Switch file type to "All files (*)
		* Navigate to data/st_data/ and choose waterstat_waterpollution2000_basinres.zip
		* Now choose open to load our zipped shapefile
	* Import dataset into PostGIS:
		* From the QGIS menu, choose "Database > DB Manager > DBManager"
		* Navigate to your "mydata" schema then choose "Import vector layer"
			* Input 'waterstat' for table name
			* Set "Primary Key" to 'gid'
			* Set "Source SRID" to 4326
			* Choose "Create Spatial Index"
			* Choose "OK"
We can load and view our data.
	* Choose the Elephant icon from the "Manage Layers" toolbar.
	* Choose "PostGIS Tutorial from the drop down, if it is not already, and choose "Connect".
	* Choose your mydata.waterstat table, and choose Add.

Let's briefly recap. We have in the last few steps spatially enabled a PostgreSQL database with PostGIS and other extensions, connected a desktop GIS tool to it, QGIS, and used QGIS to load spatial data into a table, as well as view it within the database. Our next step is to do some basic analyses on the data.