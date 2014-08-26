```
git clone https://github.com/smathermather/postgis-tutorial-data.git
```
```
cd postgis-tutorial-data/data/pgRouting
```

```
/usr/share/bin/osm2pgrouting -file cleveland.osm -conf /usr/share/osm2pgrouting/mapconfig.xml -dbname <dbname> -user <username> -host localhost -prefixtables cleveland_ -clean
```

```
SELECT pgr_dijkstra( 'SELECT osm_id AS id, source, target, length AS cost, x1, x2, y1, y2 FROM cleveland_ways',
3736,
3224,
false,
false)
```

This returns tuples == sequence, id1, id2, cost. We will join these back to our original table to get the appropriate geometry back:

WITH dijkstra AS (
	SELECT pgr_dijkstra( 'SELECT osm_id AS id, source, target, length AS cost, x1, x2, y1, y2 FROM cleveland_ways',
		3736,
		3224,
		false,
		false)
	)
SELECT osm_id, the_geom
	FROM cleveland_ways cw, dijkstra d
	WHERE cw.osm_id = (d.pgr_dijkstra).id2;


Now, try it on your own city, e.g. http://www.openstreetmap.org/export#map=12/41.4076/-81.8571