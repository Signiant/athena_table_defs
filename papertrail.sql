CREATE EXTERNAL TABLE IF NOT EXISTS papertrail_logs (
 id bigint,
 generated_at string,
 received_at string,
 source_id bigint,
 source_name string,
 source_ip string,
 facility_name string,
 severity_name string,
 program string,
 message string 
)
PARTITIONED BY (dt string)
ROW FORMAT DELIMITED 
  FIELDS TERMINATED BY '\t' 
STORED AS INPUTFORMAT 
  'org.apache.hadoop.mapred.TextInputFormat' 
OUTPUTFORMAT 
  'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'
LOCATION 's3://BUCKET/prod/logs/<MY PAPERTRAIL CUST NUM>/'
