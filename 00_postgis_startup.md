Getting Started:
* (For Windows users only):
	* Goto Github for Windows
	* Click on the gear in the upper right hand corner; choose "Options"
	* Set "Default shell" to "Git Bash"
* (For any operating system users:
	* Start
		* Git Shell (Windows)
		* Terminal (Mac)
		* A terminal (Linux)
* We will connect to a remote PostgreSQL instance piped through ssh
	* Need command to connect to server...
	``` ssh -L 63333:localhost:5432 <user>@128.199.188.115 ```
* Launch pgAdmin (give typical settings as well)
* Click on the _plug_ button in the upper left. This will launch "New Server Registration"
	* Give name (PostGIS Tutorial Server)
	* Host "localhost"
	* Port 63333
	* Username
	* Password
* Now we are connected to the database. We need to do three things more before we can load data and write queries:
	1. Create a database to work in. (You are logged in as a database super user, which means you are a demi-god on this database server. Please be kind, be careful, and don't delete or modify anyone else's work... .)
		* Double click on "PostGIS Tutorial Server"
		* Right Click on "Databases" below "PostGIS Tutorial Server"
		* Choose "New Database"
		* Name your database as your username
		* (optional) If you choose the SQL tab before choosing "OK", you will see the SQL used to create our new database
		* Choose "OK".  This will create your new database.
	2. Enable your database with the following extensions:
		* PostGIS, PointCloud, pgRouting, ...
			* Double click on your new database to connect. The red "x" on the database should disappear, and you should see a small hierarchy expand with something similar to the following items:
				* Catalogs (2)
				* Extensions (1)
				* Schemas (1)
				* Event Triggers (0)
				* Slony Replication (0)
		* Amongst other functionality, when we use "CREATE EXTENSION ..." we will be adding all sorts of new functions to our database. Let's look at what we have before we do this. Double click "Schemas" then "public" then choose functions (0). We should have no functions available specific to our database yet. 
		* Now we can actually create our extensions. Choose the SQL button at the top and type in and execute the following ("Execute Query" using the green arrow / triangle):
			* ``` CREATE EXTENSION postgis;
CREATE EXTENSION postgis_topology;
CREATE EXTENSION pgrouting;
CREATE EXTENSION pointcloud;
CREATE EXTENSION pointcloud_postgis; ```

* Now that we've created the extensions, we should have some functions previously unavailable in our database:
	* Double click "Schemas" then "public" then choose "functions (1127)" (if things have not refreshed, this will say instead "functions (0)"). Now we will be able to view the many functions that were added by enabling our extensions.
	3. Finally, we should create a working schema, so that as we add functions and tables, we aren't mucking up our public schema. This will allow us to manage our custom data with upgrades, and aids in maintaining backups as well.
		* Execute the following in your SQL window ``` CREATE SCHEMA mydata; ```
		* Now let us set that new schema in our search path, to make referencing tables and functions in that schema easier: ``` SET search_path TO mydata, public; ```
 
* Congratulations. You now have a PostGIS, PointCloud, pgRouting... enabled database. Let's use this database to its full extent.

* Next, let's connect QGIS in with PostGIS. See 01_gis_postgis_connection.md
