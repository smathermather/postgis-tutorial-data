CREATE OR REPLACE FUNCTION pgr.nn_search (geom geometry) RETURNS
int8 AS $$

SELECT id FROM pgr.roads_500_vertices_pgr AS r
		ORDER BY geom <#> r.the_geom
		LIMIT 1;

$$ LANGUAGE SQL VOLATILE;
