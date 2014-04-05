CREATE INDEX `stat_region_name_idx` ON `statistics`(`Region_Name`);
CREATE INDEX `stat_region_type_idx` ON `statistics`(`Region_Type`);
CREATE INDEX `stat_time_value_idx` ON `statistics`(`Time_Value`);

CREATE INDEX `reg_region_name_idx` ON `regions`(`Region_Name`);
CREATE INDEX `reg_region_type_idx` ON `regions`(`Region_Type`);
CREATE INDEX `reg_url_idx` ON `regions`(`URL`);