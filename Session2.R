##1) Create a single function to load the dataset of complete cases given the folder location: eg. load_complete('specdata')
load_complete <- function(directory){
    directory <- setwd(file.path("C:", "Users", "a.cortes.guerrero", "Documents", directory))

    id = 1:332
    for (i in id) {
        files <- list.files(path = "C:/Users/a.cortes.guerrero/Documents/specdata", pattern = "*.csv")
        readfiles <- lapply(files, read.csv)
        bindlist <- rbindlist(readfiles[id], use.names = TRUE)
        bindlist <- bindlist[complete.cases(bindlist),]
    }
    bindlist
}

##2) What are the dimensions (number of rows and columns) of the dataset.
dim(bindlist)

##3) Specify the column name and the data type for each column of the dataset.
sapply(bindlist, class)

##4) What is the minimum and maximum of all the numeric columns of the dataset.
apply(bindlist, 2, min)
apply(bindlist, 2, max)

##5) What is the date range of the data included. (earliest and latest day that can be found) in the dataset
x <- bindlist[order(bindlist$Date),] 
earliest <- tail(x, 1)
latest <- head(x, 1)

##6) Get the daily mean for the sulfate polutant levels in the dataset
aggregate(bindlist$sulfate ~ bindlist$Date, bindlist, mean)

##7) Get the mean nitrate levels for each monitor in the dataset.
aggregate(bindlist$nitrate ~ bindlist$ID, bindlist, mean)


########## PART 2 #########


##8) Load the iris dataset
data(iris)

##9) What are the dimensions of the iris dataset?
dim(iris)

##10) What are the column name and the data type for each column in the iris dataset?
##str(iris)
sapply(iris, class)
##sapply(iris, typeof)

##11) What is the minimum and maximum of all the numeric columns in the iris dataset?
apply(iris, 2, min)
apply(iris, 2, max)

##12) What are the different categories of species that exist in the iris dataset?
subset(iris$Species, iris$Species != iris$Species)

##13) What is the mean sepal length for the species versicolor in the iris dataset?
a <- subset(iris$Sepal.Length, iris$Species == "versicolor")
mean(a)

##14) Obtain a vector with the means of the sepal lenght, sepal width, petal length and petal width across all species from the iris dataset.
sapply(iris, mean)

##15) Obtain the mean petal length for each of the species
aggregate(iris$Petal.Length ~ iris$Species, iris, mean)
##tapply(iris$Petal.Length, iris$Species, mean)
##lapply(split(iris$Petal.Length, iris$Species), mean)