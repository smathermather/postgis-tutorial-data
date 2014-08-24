CREATE OR REPLACE FUNCTION pgr.alpha_shape (id integer, minutes integer) RETURNS
geometry AS $$

WITH alphashape AS(SELECT pgr_alphaShape('WITH 
	DD AS (
		SELECT seq, id1 AS node, cost 
		FROM pgr_drivingDistance(''SELECT id, source, target, cost FROM pgr.roads_500'',' || id || ', ' || minutes || ', false, false)), 
	dd_points AS ( 
		SELECT id_ AS id, x, y
		FROM pgr.roads_500_vertices_pgr v, DD d
			WHERE v.id = d.node)
	SELECT * FROM dd_points')),

alphapoints AS (
	SELECT ST_Makepoint((pgr_alphashape).x, (pgr_alphashape).y) FROM alphashape),

alphaline AS (
	SELECT ST_MakeLine(ST_MakePoint) FROM alphapoints)

SELECT ST_MakePolygon(ST_AddPoint(ST_MakeLine, ST_StartPoint(ST_MakeLine))) AS the_geom FROM alphaline

$$ LANGUAGE SQL VOLATILE;
