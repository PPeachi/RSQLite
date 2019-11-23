############################################################
#first: load the data
df<-read.csv("classtable.csv",header = T)
df<-df[,-1]

#second: load the RSQLite Library
library(RSQLite)

#third: create a connection to our new database, classDB.db, you can check that the .db file has been created on your working directory
conn <- dbConnect(RSQLite::SQLite(), "classDB.db")

#fourth: write the df dataset into a table names classtable_data
dbWriteTable(conn, "classtable_data", df)

#fifth: list all the tables available in the database
dbListTables(conn)

#sixth: gather the first 10 rows in the classtable_data table
dbGetQuery(conn, "SELECT * FROM classtable_data LIMIT 10")

#seventh: we also can do
dbGetQuery(conn, "SELECT day,week,secondclass FROM classtable_data LIMIT 10")
dbGetQuery(conn,"SELECT * FROM classtable_data
                 WHERE day = 903")
dbGetQuery(conn,"SELECT day,week,secondclass FROM classtable_data
                 WHERE day = 903")
dbGetQuery(conn,"SELECT day,week,secondclass FROM classtable_data
                 WHERE day LIKE '9%' AND week IN (5,6,7)")

#finally: Close the database connection to classDB
dbDisconnect(conn)



library(rmarkdown)
render("1-example.Rmd")