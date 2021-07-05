## ------------------------------------
## Surgery Research Bootcamp 2021
## Boston University

## Part 1 - Introduction to R

## ------------------------------------


#Why R?
#Using R as a calculator
#Variable assignment
#data types and structures 
#The 'help' function
#Reading Data Sets 
#Installing packages



### **************************************************************************
### Code execution
### **************************************************************************


#    Windows	           Mac	             Description

# Ctrl+Enter	      Command+Enter	           Runs current selection or line
# Ctrl+Shift+P	    Command+Shift+P	         Re-runs last executed code
# Ctrl+Shift+Enter	Command+Option+R	       Runs whole current document
# Ctrl+Alt+F	      Command+Option+F	      Runs current function definition
# Ctrl+Alt+B	      Command+Option+B	      Runs from first to current line
# Ctrl+Alt+E	      Command+Option+E	      Runs from current line to end








### **************************************************************************
### Basic Arithmetic
### **************************************************************************
14 + 47
3*5

### Assigning values to a variable

# R uses an arrow sign to assign a value to a variable:
x <- 3.2

# We can read this line as *2.71 is assigned to x*. 
# In many cases you can use equal sign `=` as well, 
# but in R it is a good practice to use arrow `<-`  and  equal sign `=` to specify the values of arguments in functions.

#### *Note:*
# Object names in R can use letters, digits, dots, and underscores. Spaces and other special characters cannot be used to name R objects.


# Print out the value of a variable in the console window:
print(x)

# Another way to print out the value of a variable:
x

# Assign a value to a variable and prints its value on the console
( x <- 4.2 )





### **************************************************************************
### Data types in R
### **************************************************************************

# Objects in R can have different types.
# Basic Data types in R:

# - Numeric (real numbers)
# - Integer (whole numbers)
# - Logical (TRUE/FALSE)
# - Character (strings)
# - Complex

# Numeric is the default data type for numbers in R:
x <- 5.24
class(x)
typeof(x)
# Numeric values are stored with *double* precision.

x<-3
class(x)
typeof(x)

x<-3L # (To store value as an integer, we can add L symbol at the end:)
class(x)
typeof(x)

y<-"type your name"
class(x)
typeof(x)





### **************************************************************************
### R Help
### **************************************************************************

# R comes with comprehensive help system.
# Use one question mark in front of the function name if you know function's name.
# Use two question marks, if you do not know function name and 
# you search for a topic. 
# If your search includes more than one word, use quotes:

# Search for a help topic for round() function:
?hist
?round
round(5.679)
round(5.679, digits=1)

# List all R help topics that include "standard deviation" phrase:
??"histogam"
??"standard deviation"














### **************************************************************************
### R Data Structures
### **************************************************************************

## R has five common data structures:

# Homogeneous:
# - vector
# - matrix/array

# Heterogeneous
# - data frame
# - list

## The following functions help to explore data structures:
# typeof(), length(), class(), str(), summary(), dim()

# We can use function c() to define a vector:
# numeric vector
x_num <- c(95.6, 93.2, 87.8, 79.1,88.1)
length(x_num)
mean(x_num)
typeof(x_num)
summary(x_num)
str(x_num)


# character vector
x_char <- c("blue", "green", "red", "pink", "orange" )

# logical vector
x_log <- c(TRUE, FALSE, FALSE, TRUE)
x_log <- c(T, F, F, T)


#Create vectors as sequence of numbers
1:10
seq(10)
seq(1, 10, by = 0.1)


#vector operations 

# define two vectors (heights in inches and weight in pounds)
heights <- c(65, 69, 60, 71, 66, 68, 64)
weights <- c(130, 142, 125, 180, 179, 154, 146)

# Calculate BMI
( bmi <- (weights/heights^2) * 703 )






### **************************************************************************
### Vector slicing
### **************************************************************************

# R uses square brackets [] to slice/subset vectors:

# extract second value from a vector
x_num[2]

# get all elements starting from second and ending with fourth
x_num[2:5]

#get first and fourth element
x_num[ c(1,5) ]




### **************************************************************************
### Missing values
### **************************************************************************

# Missing values in R are represented with the NA word. 
# It can be used for all types of vectors:


# numeric vector
x_num <- c(15.6, NA, NA, 17.8, 19.1, NA)


# Functions is.na() and anyNA() help to identify 
# if there are any missing value and if so, which one:

# Check if there are any missing values
anyNA(x_num)

# Check each element in a vector to see which elements are missing'
is.na(x_num)

# Identify indecies of the missing elements
which( is.na(x_num) )

# Check how many missing elements
sum( is.na(x_num) )



#Almost any computation involving a missing value will return a missing value. 
mean(x_num)  # Calculate mean value of vector x_num

# Many R functions have a special argument, that allows to remove all missing values:
mean(x, na.rm=TRUE) # Calculate mean value of vector x_num ignoring missing values







### **************************************************************************
### Factors
### **************************************************************************

# Factors in R are used to store categorical data. 
# When R vectors are converted to factors, 
# each unique value is assigned an integer value (label). 
# By default these integer labels are assigned alphabetically:

# define a character vector:
ans <- c("yes", "no", "no", "yes", "yes", "yes", "no", "no")
class(ans)
summary(ans)

# convert vector to factor:
?factor
ans <- factor(ans) #if levels are not specified then it alphabetically assign integers 
ans<-factor(ans, levels = c("no","yes"))
class(ans)
table(ans)
summary(ans)


# Sometimes, categorical data are coded as integer values 
# (for example 1-for female, 2-for male). 
# It makes sense to convert them to factors and assign appropriate labels:

# gender defined with integer values
gender <- c(1,1,1, 2, 2, 1, 1, 1, 2, 2, 1, 2, 2, 2, 1, 1)
summary (gender)

# convert vector to factor and assign appropriate labels
gender <- factor( gender, levels=c(1,2), labels = c("female", "male"))
summary(gender)




### **************************************************************************
### Available Data Sets in R
### **************************************************************************

data()
?mtcars




### **************************************************************************
### Setting up the current working directory
### **************************************************************************

#Discuss setwd() and getwd()
#getwd():returns an absolute filepath representing the current working directory of the R process
#setwd(dir) is used to set the working directory to dirrectory 





### **************************************************************************
### Reading Data
### **************************************************************************

# R can read data written in many different formats. 
# Today we will read basic CSV file.
# The following two links gives many more examples of importing data 
# saved in different formats into R
#            https://cran.r-project.org/doc/manuals/r-release/R-data.html
#            https://www.datacamp.com/community/tutorials/r-data-import-tutorial



# Functions in R that can be used for the exploration of the imported datasets:
# - dim(x)     -  dimension of the data set 
# - View(x)    - view imported data
# - names(x)   - list column names
# - head(x)    - print first 6 records
# - tail(x)    - print last 6 records
# - summary(x) - print summary of each column in the dataset
# - str(x)     - print structure of the object



## **Note:** R does not allow special characters (like % or a space character) 
# in column names, so `read.csv()` function changed *%* on `X` and 
# spaces on period characters. 



### option 1: 
#click Session menu>Set Working Directory>Choose Directory.
#Then you just need to specify the file name in your working directory
dat<-read.csv("NE_HealthData.csv", header=TRUE, sep = ",")
# depending on the types of separation of columns in the data set, you can specify sep= ""
# If it is tab-delimited text file then you can specify sep= "\t"
# If it is separated using space then you can specify sep= ""
# If it is separated using comma then you can specify sep= ","
#FOR MORE INFORMATION GO TO THE BBlearn: Class 2 > Review (Reading data sets)> reading_example.html  



#once you choose the directory after clicking Session menu>Set Working Directory>Choose Directory.
#you will see your current working directory path in the console 
#You can copy this path for future reference. 

#This is my current working directory path. Your path is different. 
setwd("C:/Users/chathu/Desktop/R Ladies/Surgery Research Bootcamp 2021/Introduction to R_Part1") # change it to your path 
dat<-read.csv("NE_HealthData.csv", header=TRUE)


### option 2: 
# you can directly specify the path inside the read.table()
#Your path is different (type your path )
dat<-read.csv("C:/Users/chathu/Desktop/R Ladies/Surgery Research Bootcamp 2021/Introduction to R_Part1/NE_HealthData.csv")
dat<-read.csv("C:\\Users\\chathu\\Desktop\\R Ladies\\Surgery Research Bootcamp 2021\\Introduction to R_Part1\\NE_HealthData.csv")





#character variables are converted to factors! (For R version < 4)
#Therefore, stringsAsFactors = FALSE is necessary for R version < 4
dat<-read.table("NE_HealthData.csv", header=TRUE, sep=",", stringsAsFactors = FALSE) # read.table can be used to read txt files. 
str(dat)
head(dat)
dim(dat)








### **************************************************************************
### Slicing Data Frames
### **************************************************************************

#get third row
dat[3,]

#get third column (select column from dataset)
dat[,5]


dat$Smokers


#get first seven rows and second, forth, and fifth columns
dat[ 1:13, c(2,4,5) ]
NewDat<-dat[ 1:13, c(2,4,5) ] #assign to object (you can refer it later)
NewDat


#type of variable 
typeof(dat$Physically.Inactive)
class(dat$Physically.Inactive)

#mean of Physically.Inactive
mean(dat$Physically.Inactive)






### **************************************************************************
### write Data sets 
### **************************************************************************

#If you want to save the file in the current working directory 
write.csv(NewDat, file = "mydatafile.csv")


#If you want to save it in a different folder then you can specify the path 
write.csv(NewDat, "C:/Users/chathu/Desktop/R Ladies/Surgery Research Bootcamp 2021/Introduction to R_Part1/mydatafile.csv", row.names = F)






### **************************************************************************
### Installing R packages
### **************************************************************************

# R packages are collections of functions and data sets developed by 
# the community of researchers and programmers. 

# There are two official R repositories: 
#               [CRAN](https://cran.r-project.org/) 
#       [Bioconductor](https://www.bioconductor.org/).

# The first one contains packages applicable to many research areas, 
# while the second one is dedicated to the functions and datasets 
# related to high-throughput genomic data.

# [CRAN Task Views](https://cran.r-project.org/web/views/) allows you to browse 
# packages by topic and provide tools to automatically 
# install all packages for special areas of interest. 



# If we would like to use a certain package that is not yet installed in your base R suite, then you need to install it and then load it into R for use
# To install packages from the  CRAN use install.packages() function:
install.packages("dplyr")
library(dplyr)

# In RStudio, the list of installed packages are available 
# in the lower right window under *Packages tab*.




### **************************************************************************
### Additional Links
### **************************************************************************
# - R Package installation: 
#                 https://www.datacamp.com/community/tutorials/r-packages-guide
# - Installation of Bioconductor packages :  
#                 https://www.bioconductor.org/install/
# - Factors in R: 
#                 https://data-flair.training/blogs/r-factor-functions/
# - R Data Import and Export: 
#                 https://cran.r-project.org/doc/manuals/r-release/R-data.html
# - More on R Data Import and Export: 
#          https://www.datacamp.com/community/tutorials/r-data-import-tutorial






### **************************************************************************
### Homework (optional)
### **************************************************************************

# 1. Read [NE_DemographicsData.csv]
# 2. Print the structure of the data frame. How many columns and how many rows are there?
# 3. What are the variable types in R for *Life.Expectancy* and "state" columns? 
# 3. Use summary() and other functions to explore the imported data frame
# 4. Check whether County column has any missing values.
# 5. What is the minimum value of *Life.Expectancy* column?
# 7. Calculate the total population in New England (use *Population* column and use "sum" function to get the total)
# 8. Use help option to find information about "matrix" function. Then generate any 2 by 3 matrix with arbitrary elements (rows=2, col=3). 

