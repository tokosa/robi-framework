library(RJDBC)
source('src/Core/Config.R')

Sys.setenv(REDSHIFT_DRIVER='com.amazon.redshift.jdbc42.Driver')
Sys.setenv(REDSHIFT_DRIVER_PATH="path-to/RedshiftJDBC42-1.2.12.1017.jar")


Sys.setenv(JDBC_URL =sprintf(
      'jdbc:redshift://%s:%s/%s?ssl=true&sslMode=verify-full&sslrootcert=%s&user=%s&password=%s',
      "Rewrite hostname",
      'Rewrite port',
      'Rewrite dbname',
      'Rewrite cert file path ',
      'Rewrite user',
      'Rewrite PW'))
      
