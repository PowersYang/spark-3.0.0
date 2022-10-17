-- This test file was converted from inner-join.sql.
CREATE TEMPORARY VIEW t1 AS SELECT * FROM VALUES (1) AS GROUPING(a);
CREATE TEMPORARY VIEW t2 AS SELECT * FROM VALUES (1) AS GROUPING(a);
CREATE TEMPORARY VIEW t3 AS SELECT * FROM VALUES (1), (1) AS GROUPING(a);
CREATE TEMPORARY VIEW t4 AS SELECT * FROM VALUES (1), (1) AS GROUPING(a);

CREATE TEMPORARY VIEW ta AS
SELECT udf(a) AS a, udf('a') AS tag FROM t1
UNION ALL
SELECT udf(a) AS a, udf('b') AS tag FROM t2;

CREATE TEMPORARY VIEW tb AS
SELECT udf(a) AS a, udf('a') AS tag FROM t3
UNION ALL
SELECT udf(a) AS a, udf('b') AS tag FROM t4;

SELECT tb.* FROM ta INNER JOIN tb ON ta.a = tb.a AND ta.tag = tb.tag;
