git clone https://github.com/smathermather/postgis-tutorial-data.git

cd postgis-tutorial-data/data/pgRouting

bunzip2 cleveland.osm.bz2

/usr/share/bin/osm2pgrouting -file cleveland.osm -conf /usr/share/osm2pgrouting/mapconfig.xml -dbname AAnkhBuns -user AAnkhBuns -host localhost -prefixtables cleveland_ -clean

SELECT pgr_dijkstra( 'SELECT osm_id AS id, source, target, length AS cost, x1, x2, y1, y2 FROM cleveland_ways',
3736,
3224,
false,
false)

tuples == sequence, id1, id2, cost

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