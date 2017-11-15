# *****************************
# CREATE TABLE `sample_table` (
#   `sample_id` bigint(20) NOT NULL AUTO_INCREMENT,
#   `sample_name` varchar(50) NOT NULL,
#   `post` text NOT NULL,
#   `created` datetime NOT NULL,
#   PRIMARY KEY (`sample_id`)
# ) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4
class SampleActiveRecord < ApplicationRecord
  self.table_name = "sample_table"
  self.primary_key = "sample_id"
end
