# template
starting point for a new Mosaic site

Mosaic websites are Java web applications that run in an engine such as Apache Tomcat and uses PostgreSQL for the database.

notes:
- if you want to rename or modify the main class for the site, you will need to modify the WEB-INF/src/template/TEMPLATE.java class and compile it. Change the site_class context-param in WEB-INF/web.xml if you change the class name or package.
- import the template.sql file into your database
- change the admin password with "update people set password=MD5(new password) where id=1;
- enter the database connection details in META-INF/context.xml
