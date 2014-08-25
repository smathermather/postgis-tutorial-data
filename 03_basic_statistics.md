In our previous steps, we enabled our database to handle spatial data, we loaded data into it, but the real power with PostGIS isn't the storage of spatial data, it's the analysis and manipulation of the data that can then be done with it.

For our next step we'll calculate the area of our watersheds. We have one potential problem with calculating area however-- our data are in a geographic coordinate system, WGS84. Our units have no distance equivalence.

The function we'll use to calculate area on our dataset, ST_Area typically calculates area in the units of the coordinate system of the data. So, for example, if our data were in a Universal Transverse Mercator projection, the units of area returned by ST_Area would be meters. If our data were in Ohio State Plane North (ft), the units returned would be feet. When we apply ST_Area against geographic data in the WGS84 datum, which is in the angular coordinates of longitude as well as latitude, and do it in the correct way, we are fortunate that PostGIS is clever enough to return our values in meters. Let us proceed.

For this exercise, let us return to pgAdmin as our tool of choice. Activate your database, and launch the Query Tool.

The naive approach for calculating area would be as follows:

``` SELECT ST_Area(geom) AS area FROM waterstat; ```

But, as it happens, this returns our results as false areas in angular coordinates. Fortunately, ST_Area is an overloaded function, meaning that depending on what parameters you feed it, its behavior may be different.  In the above example, we are passing the function a geometry, in which case, the ST_Area function will take our literal input and return a literal value. In order to get the function to calculate geodetic area in meters square units, we require two conditions: the first is that we pass it data in the WGS84 datum; the second is that the are passed as geography, not geometry. For PostGIS, these are distinct types. Fortunately, it is easy to translate between them for our case. We will use the PostgreSQL specific ```::``` operator to CAST our geometry as a geography. (We could also use a formal CAST, but the operator is so convenient.)

``` SELECT ST_Area(geom::geography) AS area FROM waterstat;
```

Now, for completeness, we will create this as its own new table, and update it accordingly, and also convert it to square killometers along the way:

```
CREATE TABLE waterstat_area AS
	SELECT *, ST_Area(geom::geography) / 1000000 AS area FROM waterstat;
```


One could also do this as an update query against the original table.

```
ALTER TABLE waterstat
   ADD COLUMN area numeric;

UPDATE waterstat SET area = ST_Area(geom::geography) / 1000000
```

To summarize, we can now load spatial data in a PostGIS database, view it as a map in open source desktop software, and now also run basic statistics against it. For the next exercise we will go a little bit deeper.