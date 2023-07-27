additional_options={
    "hoodie.table.name": "${table_name}",
    "hoodie.datasource.write.storage.type": "COPY_ON_WRITE",
    "hoodie.datasource.write.operation": "upsert",
    "hoodie.datasource.write.recordkey.field": "_row_key",
    "hoodie.datasource.write.precombine.field": "timestamp",
    "hoodie.datasource.write.partitionpath.field": "partition",
    "hoodie.datasource.write.hive_style_partitioning": "true",
    "hoodie.datasource.hive_sync.enable": "true",
    "hoodie.datasource.hive_sync.database": "${database_name}",
    "hoodie.datasource.hive_sync.table": "${table_name}",
    "hoodie.datasource.hive_sync.partition_fields": "partition",
    "hoodie.datasource.hive_sync.partition_extractor_class": "org.apache.hudi.hive.MultiPartKeysValueExtractor",
    "hoodie.datasource.hive_sync.use_jdbc": "false",
    "hoodie.datasource.hive_sync.mode": "hms",
    "path": "s3://${bucket_name}/lakehouse/>"
}

dataFrame.write.format("hudi") \
    .options(**additional_options) \
    .mode("overwrite") \
    .save()