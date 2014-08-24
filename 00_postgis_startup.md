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
* Need command to connect to server...

* Launch pgAdmin (give typical settings as well)
* Click on the _plug_ button in the upper left. This will launch "New Server Registration"
	* Give name (PostGIS Tutorial Server)
	* Host "localhost"
	* Port ???
	* Username
	* Password

Now we are connected to the database. We need to do two things more before we can load data and write queries:
1) Create a database to work in. (You are logged in as a database super user, which means you are a demi-god on this database server. Please be kind, be careful, and don't delete or modify anyone else's work... .)
	* Double click on "PostGIS Tutorial Server"
	* Right Click on "Databases" below "PostGIS Tutorial Server"
	* Choose "New Database"
	* Name your database. Your username would be a good choice. Whatever you choose, make sure you remember the name of your database (there will be many databases in that list very soon).
	* (optional) If you choose the SQL tab before choosing "OK", you will see the SQL used to create our new database
	* Choose "OK".  This will create your new database.
2) Enable your database with the following extensions:
	* PostGIS, PointCloud, pgRouting, ...
		* Double click on your new database to connect. The red "x" on the database should disappear, and you should see a small hierarchy expand with something similar to the following items:
			* Catalogs (2)
			* Extensions (1)
			* Schemas (1)
			* Event Triggers (0)
			* Slony Replication (0)
		* Amongst other functionality, when we use "CREATE EXTENSION ..." we will be adding all sorts of new functions to our database. Let's look at what we have before we do this. Double click "Schemas" then "public" then choose functions (0). We should have no functions available specific to our database yet. 
		* Now we can actually create our extensions. Choose the SQL button at the top and type in and execute the following ("Execute Query" using the green arrow / triangle):
			* ```CREATE EXTENSION postgis;
			* ```CREATE EXTENSION pointcloud;
			* ```CREATE EXTENSION pgrouting;
			* ...
Congratulations. You now have a PostGIS, PointCloud, pgRouting... enabled database. Let's use this database to its full extent.
