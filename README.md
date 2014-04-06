MotionChart in Sgvizler
=======================

**NOTE: Not for public view yet! The project requires the upcoming Semantika 1.3 library**

![](https://raw.github.com/obidea/semantika-sgvizler/master/res/motion-chart.png)

In this project, I'm going to give you a tutorial how to create a motion chart using Sgvizler with Semantika backend.
The tutorial will guide you to:

1. Import data to MySQL,
2. Setup SPARQL endpoint using Semantika+Sesame
3. Deploy the data visualization page.


## Preparation

[Download and unzip the content of this project to your local project directory](https://github.com/obidea/semantika-sgvizler/archive/master.zip).
The project has a file structure as follows.
```
semantika-sgvizler
+- data
   +- *.sql               --> SQL scripts to create tables and indexes
   +- *.csv               --> INDO-DAPOER raw data
   +- load_data.sh        --> Bash script for importing data
+- model
   +- indodapoer.cfg.xml  --> Semantika configuration file
   +- indodapoer.owl      --> OWL ontology file
   +- *.tml.xml           --> Semantika mapping files
+- visualization
   +- css                 --> Stylesheet
   +- js                  --> Some javascripts including sqvizler.js
   +- index.html          --> Main page
+- res (ignore this)
```

## Step 1: Import data to MySQL

Prerequisite: [MySQL](http://www.mysql.com/) (tested version 5.x)

[Please follow this link to import the necessary data to your local machine](https://github.com/obidea/semantika-sgvizler/tree/master/data). Make sure the MySQL server is running.

## Step 2: Setup SPARQL endpoint

Prerequisite: [Apache Tomcat](http://tomcat.apache.org/) (tested version 7.0.50)

* Download [semantika-sesame](https://github.com/obidea/semantika-sesame/releases) bundle (build 13+)
* Unzip the bundle and deploy the WAR files to `$CATALINA_HOME/webapps/` where `$CATALINA_HOME` represents the location
directory of your Tomcat installation. In UNIX, the usual location is `/usr/share/tomcat7`
* Enable the CORS (Cross-Origin Resource Sharing) filter in Tomcat. To do that you must edit the
`$CATALINA_HOME/conf/web.xml` file by adding these lines as [suggested by this page](http://enable-cors.org/server_tomcat.html).
```
<filter>
  <filter-name>CorsFilter</filter-name>
  <filter-class>org.apache.catalina.filters.CorsFilter</filter-class>
</filter>
<filter-mapping>
  <filter-name>CorsFilter</filter-name>
  <url-pattern>/*</url-pattern>
</filter-mapping>
```
* Run the Tomcat server. The container will unpack the WAR files and run the Sesame Workbench.

### Preparing Semantika model
* Edit the configuration file `model/indodapoer.cfg.xml` and adjust the database parameters accordingly.
* Complete the file location for the mapping resources using `file://` protocol. For example, if the mapping files
are at `/home/project/indodapoer/model` then complete the location to `file:///home/project/indodapoer/model/statistics.tml.xml`,
and so on.
* Go to address `http://localhost:8080/sesame-workbench` and select "New repository" on the left menu.

![](https://raw.github.com/obidea/semantika-sgvizler/master/res/new-repository.png)

* Fill the configuration file location and select "Create"
* Make sure no errors were generated by looking at the console log.
* Write down the endpoint address, e.g., `http://localhost:8080/openrdf-sesame/repositories/indodapoer`

![](https://raw.github.com/obidea/semantika-sgvizler/master/res/endpoint.png)


## Step 3: Deploy the data visualization page

* Copy the whole content in `visualization` folder to `$CATALINA_HOME/webapps/indodapoer`
* If you use a different endpoint address as in the example, you need to edit the `index.html` file and change the
default endpoint URL.
* Go to address `http://localhost:8080/indodapoer/` to see the visualization and play with it.


Questions?
=========

Please join the [community](https://groups.google.com/forum/#!forum/obda-semantika) to address your related questions.
