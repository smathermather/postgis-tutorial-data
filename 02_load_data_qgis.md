Background:
	* We will be loading data from a zipped shapefile, a specialized geographic format that is a formal and defacto standard, and quite common. The dataset itself is ????.
	* In this exercise, we will be using PostGIS as storage for the data, as well as a tool to analyze our data, using the ST_Area function that we installed when we enabled the extension to calculate areas on the data.
	* ST_Area, when run against most data, calculates area in the units of the coordinate system of the data. So, for example, if our data were in a Universal Transverse Mercator projection, the units of area returned by ST_Area would be meters. If our data were in Ohio State Plane North (ft), the units returned would be feet. When we apply ST_Area against geographic data in the WGS84 datum, which is in the angular coordinates of longitude as well as latitude (and thus doesn't really have an area inherently associated directly with the coordinates like planar coordinates do), we get back units of meters. This is very useful for global datasets like ours, when we want sensible (and accurate!) areas back.

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