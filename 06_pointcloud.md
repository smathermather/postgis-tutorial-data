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
    <Option name="table">18001190PAS</Option>
    <Option name="srid">3362</Option>
    <Filter type="filters.chipper">
      <Option name="capacity">20</Option>
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

