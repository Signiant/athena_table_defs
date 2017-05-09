CREATE EXTERNAL TABLE IF NOT EXISTS papertrail.papertrail_logs (
 'id' bigint,
 'generated_at' string,
 'received_at' string,
 'source_id' bigint,
 'source_name' string,
 'source_ip' string,
 'facility_name' string,
 'severity_name' string,
 'program' string,
 'message' string 
)
PARTITIONED BY (dt string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.lazy.LazySimpleSerDe'
WITH SERDEPROPERTIES (
 'serialization.format' = ‘ ‘,
 'field.delim' = ' '
) LOCATION 's3://BUCKET/prod/logs/<MY PAPERTRAIL CUST NUM>/'
