CREATE TABLE pgr.alpha_test AS
WITH dest_ids AS (
	SELECT pgr.nn_search(the_geom) AS id FROM pgr.dest_pts
)
SELECT pgr.alpha_shape(id::int, 5)::geometry, id FROM dest_ids;
