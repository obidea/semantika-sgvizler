INDO-DAPOER Database
====================

This project uses data from INDO-DAPOER (Indonesia Database for Policy and Economic Research) which is openly available from 
[The World DataBank](http://databank.worldbank.org/data/views/variableselection/selectvariables.aspx?source=indo~dapoer-(indonesia-database-for-policy-and-economic-research)) site. However, we need to relocate them into a database for Semantika to work over the data.

Prerequisite: [MySQL](http://www.mysql.com/) (tested version 5.x) and [MySQL Workbench](http://www.mysql.com/products/workbench/)

* Open MySQL Workbench and create a new database, e.g., `indodapoer`.

* Open an SQL editor and run the SQL script `CreateTables.sql` and followed by `CreateIndexes.sql`. Copy-and-paste the
creation command if necessary.

* Open a Terminal or a command-line prompt and run the load_data script
```
$ ./load_data.sh INDODAPOER_Data.csv indodapoer statistics
$ ./load_data.sh CUSTOM_Regions.csv indodapoer regions
```

* Check the tables to make sure the data was loaded correctly.

![](https://raw.github.com/obidea/semantika-sgvizler/master/res/statistics-data.png)
