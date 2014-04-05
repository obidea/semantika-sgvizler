#!/bin/sh
MYSQL_ARGS="-h localhost -u root -p"
DELIM=","

# Usage:
#   ./load_data.sh INDODAPOER_Data.csv indodapoer statistics
#   ./load_data.sh CUSTOM_Regions.csv indodapoer regions
CSV="$1"
DB="$2"
TABLE="$3"

#[ "$CSV" = "" -o "$TABLE" = "" ] && echo "Syntax: $0 csvfile tablename" && exit 1

#FIELDS=$(head -1 "$CSV" | sed -e 's/'$DELIM'/` double,\\n`/g')
#FIELDS='`'"$FIELDS"'` varchar(255)'
#echo "$FIELDS" && exit

mysql $MYSQL_ARGS $DB -e "
#DROP TABLE IF EXISTS $TABLE;
#CREATE TABLE $TABLE ($FIELDS);

LOAD DATA LOCAL INFILE '$(pwd)/$CSV' INTO TABLE $TABLE
FIELDS TERMINATED BY '$DELIM' OPTIONALLY ENCLOSED BY '\"'
IGNORE 1 LINES
;
"
