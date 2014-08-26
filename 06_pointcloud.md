Recommended reading: http://workshops.boundlessgeo.com/tutorial-lidar/

```
cd data/pointcloud
```

```
unzip 18001190PAS.zip
```

Edit 18001190PAS.xml for database connection info:

```
<?xml version="1.0" encoding="utf-8"?>
<Pipeline version="1.0">
  <Writer type="drivers.pgpointcloud.writer">
    <Option name="connection">dbname='AAnkhBuns' user='AAnkhBuns' host='localhost'</Option>
    <Option name="table">a18001190PAS</Option>
    <Option name="srid">3362</Option>
    <Filter type="filters.chipper">
      <Option name="capacity">400</Option>
      <Filter type="filters.cache">
        <Reader type="drivers.las.reader">
          <Option name="filename">18001190PAS.las</Option>
          <Option name="spatialreference">EPSG:3362</Option>
        </Reader>
      </Filter>
    </Filter>
  </Writer>
</Pipeline>
```

```
pdal pipeline pc_config.xml
```

Now we can visualize this patch table as a set of heights:

```
DROP TABLE IF EXISTS a18001190PAS_ph;

CREATE TABLE a18001190PAS_ph AS
SELECT
  pa::geometry(Polygon, 3362) AS geom,
  PC_PatchAvg(pa, 'Z') AS elevation,
  PC_PatchMax(pa, 'Z') - PC_PatchMin(pa, 'Z') AS height
FROM a18001190PAS;
```