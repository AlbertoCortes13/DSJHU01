##What are the dimensions (number of rows and number of columns) of the data set?
dim(x) 

##2) What is the name of the last column of the data set?
names(x)
colnames(x)
tail(names(x), 1)

##3) For the same column, what is the datatype?
class(x$Day)

##4) List all values for the 50th item (values in line 50) in the data set?
x[1:50,]

##5) Remove from the data all records with NA in the first column in the data set.
y <- na.omit(x$Ozone)

##6) List all values for the new 50th item (values in line 50) in the data set?
y[50]

##7) Remove all incomplete cases from the dataset (row with an NA in any column).
z <- x[complete.cases(x),]

##8) What are the dimensions of the data set for all complete cases?
dim(z)

##9) Get the date (day and month) with the highest Ozone value for all complete cases in the dataset.
a <- subset(z, z$Ozone = max(z$Ozone))
a[,5:6]

##10) Create a subset with only the 7th and 9th months.
c <- subset(x, x$Month == 7 | x$Month == 9)

##11) What is the average temperature in the subset created in question 10?
mean(c$Temp)

##12) What is Fridays' average temperature of the subset created in question 10?
b <- subset(c, c$Month == 7 & c$Day %in% c(1, 8, 15, 22, 29) | c$Month == 9 & c$Day %in% c(2, 9, 16, 23, 30))
mean(b$Temp)

##13) Create a table containing the Wind's average, minimum value, 25th percentile (2nd quartile), median value, 75th percentile (3rd quartile) and maximum value for May and August (month 5 and 8) complete cases for all days in the dataset. (Consider the data is for the year 2016)
m <- subset(z, z$Month == 5 | z$Month == 8)
t <- table(mean(m$Wind),min(m$Wind),quantile(m$Wind, .25, na.rm = TRUE),median(m$Wind),quantile(m$Wind, .75, na.rm = TRUE),max(m$Wind), dnn = list("avg", "min", "2nd quartile", "median", "3rd quartile", "max"))

##14) Create a table containing the Wind's average, minimum value, 25th percentile (2nd quartile), median value, 75th percentile (3rd quartile) and maximum value for May and August (month 5 and 8) complete cases for all days except Mondays in the dataset. (Consider the data is for the year 2016)
n <- subset(z, z$Month == 5 & !(z$Day %in% c(2, 9, 16, 23, 30)) | z$Month == 8 & !(z$Day %in% c(1, 8, 15, 22, 29)))
tm <- table(mean(n$Wind), min(n$Wind), quantile(n$Wind, .25, na.rm = TRUE), median(n$Wind), quantile(n$Wind, .75, na.rm = TRUE), max(n$Wind), dnn = list("avg", "min", "2nd quartile", "median", "3rd quartile", "max"))
