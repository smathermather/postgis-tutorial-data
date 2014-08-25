* ST_Area Example
	* To be written (but straight forward)
* Getting data in -- QGIS and shp2pgsql
	* Basic Structure:
		* shp2pgsql -s <CRS> <name>.shp <tablename>
		* Typically we combine that with a _pipe_ to send it to the database
		* shp2pgsql -s <CRS> <name>.shp <tablename> | psql -U <user> -d <database>

* Proportional Sum
	* Code in book
* Proximity filtering to rotate points
	* Code in book
* Translating, Scaling, and rotating geometries advanced (tie in with QGIS-based view)
	* Code in book
* pgRouting driving distance example
	* Code in book
* Point Cloud Example
	* Code in repo
