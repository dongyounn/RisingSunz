
cardata = LOAD '/input/cardata.csv' USING PigStorage(',');
RisingSunZ = FOREACH cardata GENERATE
$1 AS time:chararray,
$4 AS spped:double,
$35 AS fuel:double,
$53 AS distance:double;

STORE RisingSunZ INTO '/juho';
