Background:
	* We will be loading data from a zipped shapefile, a specialized geographic format that is a formal and defacto standard, and quite common. The dataset itself is ????.
	* In this exercise, we will be using PostGIS as storage for the data, as well as a tool to analyze our data, using the ST_Area function that we installed when we enabled the extension to calculate areas on the data.
	* ST_Area, when run against most data, calculates area in the units of the coordinate system of the data. So, for example, if our data were in a Universal Transverse Mercator projection, the units of area returned by ST_Area would be meters. If our data were in Ohio State Plane North (ft), the units returned would be feet. When we apply ST_Area against geographic data in the WGS84 datum, which is in the angular coordinates of longitude as well as latitude (and thus doesn't really have an area inherently associated directly with the coordinates like planar coordinates do), we get back units of meters. This is very useful for global datasets like ours, when we want sensible (and accurate!) areas back.

Let's load some data:
	* From the QGIS menu, choose "Database > DB Manager > DBManager"