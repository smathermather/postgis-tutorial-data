/*
First we explode the patches into points,
 and along the way grab the minimum value
for the patch, and the id
*/
WITH lraw AS (
    SELECT PC_Explode(pa) AS ex,  PC_PatchMin(pa, 'Z') AS min, id
    FROM test1
    ),
/*
Calculate our height value ( Z - min )
*/
heights AS (
    SELECT PC_Get(ex, 'X') || ',' || PC_Get(ex, 'Y') || ',' -- grab X and Y
    || PC_Get(ex, 'Z') - min                -- calculate height
    || ',' ||
-- And return our remaining dimensions
    PC_Get(ex, 'Intensity') || ',' || PC_Get(ex, 'ReturnNumber') || ',' || PC_Get(ex, 'NumberOfReturns') || ',' ||
    PC_Get(ex, 'ScanDirectionFlag') || ',' || PC_Get(ex, 'EdgeOfFlightLine') || ',' ||
    PC_Get(ex, 'Classification') || ',' || PC_Get(ex, 'ScanAngleRank') || ',' || PC_Get(ex, 'UserData') || ',' ||
    PC_Get(ex, 'PointSourceId') || ',' || PC_Get(ex, 'Time') || ',' || PC_Get(ex, 'PointID') || ',' || PC_Get(ex, 'BlockID')
    AS xyheight, PC_Get(ex, 'Z') - min AS height, id FROM lraw
    ),
-- Now we can turn this aggregated text into an array and then a set of points
heightcloud AS (
    SELECT PC_MakePoint(1, string_to_array(xyheight, ',')::float8[]) pt, height_classify(height) heightclass, id FROM heights
    )
-- Finally, we bin the points back into patches grouped by our heigh class and original ids.
SELECT PC_Patch(pt), id / 20 AS id, heightclass FROM heightcloud GROUP BY id / 20, heightclass;