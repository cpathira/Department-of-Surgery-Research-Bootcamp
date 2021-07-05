## ------------------------------------
## Surgery Research Bootcamp 2021
## Boston University

## Part 2 - Introduction to R

## ------------------------------------


### Exploratory Data Analysis 
#summary  
#Graphics in R
#Basic Data Management (Base R)



### **************************************************************************
### Generating Descriptive Statistics & Graphs 
### **************************************************************************


#Read in Framingham Dataset
#setwd("C:/Users/chathu/Desktop/R Ladies/Surgery Research Bootcamp 2021/Introduction to R_part2")
fhs<-read.csv("FramHSn500.csv")
dim(fhs)
head(fhs)
str(fhs)
summary(fhs)


###   (Descriptive Statistics)
#mean, median, SD, IQR for numerical variables 
# tables and proportional tables for categorical variables


###    (plots)
#histogram, boxplots, QQplots for numerical variables 
#barplots for categorical variables



### **************************************************************************
### Continuous variable 
### **************************************************************************

#Histogram  (for numerical Variables)
hist(fhs$TOTCHOL)
mean(fhs$TOTCHOL)
sd(fhs$TOTCHOL)


hist(fhs$SYSBP)
hist(fhs$SYSBP,xlim=c(50,300),ylim=c(0,200),main="Histogram of Systolic BP",xlab="Systolic BP")
median(fhs$SYSBP)
quantile(fhs$SYSBP)
IQR(fhs$SYSBP)


### other graphs (boxplot, QQplots)

boxplot(fhs$SYSBP,main="Boxplot of Systolic Blood Pressure",ylab="Systolic Blood Pressure (mmHg)")
#QQplot
qqnorm(fhs$SYSBP,main="QQplot for Systolic BP")
qqline(fhs$SYSBP)







### **************************************************************************
### Categorical variable 
### **************************************************************************



#Barplot (for categorical variables)
table(fhs$SEX) #1= male 2=Female 

t<-table(fhs$SEX)
prop.table(t)


barplot(table(fhs$SEX))#Frequency Bar chart
barplot(t)#Relative Frequency Bar chart

barplot(table(fhs$SEX),main="Bar Chart of Sex",ylab="Frequency",xlab="SEX")
barplot(table(fhs$SEX),main="Bar Chart of Sex",ylab="Frequency",xlab="SEX",names=c("male","female"))




### **************************************************************************
### For two Categories 
### **************************************************************************


#Two categories (descriptives) 
t2<-table(fhs$SEX,fhs$CURSMOKE)
prop.table(t2)   #total percentage
prop.table(t2,1) #row percentage (If we want to get the  percentages nonsmokers in each SEX category )
prop.table(t2,2) #column percentage (If we want to get the  percentages men in each CURSMOKE )




#Two categories (graphs) 
barplot(t2)
barplot(t2,main="Smoking Status by Sex",ylab="Frequency", xlab="SMOKING STATUS",names=c("NonSmokers","Smokers"),col=c("blue","red"),ylim=c(0,300))
#http://research.stowers.org/mcm/efg/R/Color/Chart/ColorChart.pdf


#Side by Side Barplots with legends
barplot(t2,main="Smoking Status by Sex",ylab="Frequency", xlab="SMOKING STATUS",
        names=c("NonSmokers","Smokers"),col=c("blue","red"),ylim=c(0,200),beside=TRUE)

legend("topleft",c("Male","Female"),fill=c("blue","red"))







### **************************************************************************
### For two variables (One continuous and One categorical) 
### **************************************************************************


#suppose we want to calculate mean of systolic blood pressure by sex 
tapply(fhs$SYSBP,fhs$SEX, FUN = mean)
#suppose we want to calculate median of systolic blood pressure by sex 
tapply(fhs$SYSBP,fhs$SEX, FUN = median)

boxplot(SYSBP~SEX,data=fhs,main="Side by side boxplot of systolic blood pressure",names=c("Males","Females"))









### **************************************************************************
### Associations of two continuous variables (Scatter Plots) 
### **************************************************************************

#correlation coefficient 
cor(fhs$SYSBP, fhs$FRAM_BMI)

plot(SYSBP~FRAM_BMI,data=fhs,main="Scatterplot of Systolic Blood Pressure versus BMI",ylab="Systolic Blood Pressure")


#Advanced Feature (optional)
plot(SYSBP~FRAM_BMI,data=fhs,main="Scatterplot of Systolic Blood Pressure versus BMI",ylab="Systolic Blood Pressure")
abline(lm(SYSBP~FRAM_BMI,data=fhs))
text(40, 170, "regression line")



### **************************************************************************
### Saving Plots 
### **************************************************************************

#saving graphs
#filetype("filename")
# write R codes for the plot
#dev.off()


pdf("Scatter_Plots.pdf")
plot(SYSBP~FRAM_BMI,data=fhs,main="Scatterplot of Systolic Blood Pressure versus BMI",ylab="Systolic Blood Pressure")
dev.off()




### **************************************************************************
### Attach Function 
### **************************************************************************


#functions are best used when you are analyzing a single data frame 
#attach (use with caution!!)
attach(fhs)
mean(SYSBP)# no need to specify $
summary(SYSBP) 
plot(SYSBP~FRAM_BMI)
#gives an error when you have another same name for column in another data set  








### **************************************************************************
#Basic Data Management (Optional)
### **************************************************************************

#Ozone= 	Ozone concentration (ppb)
#Solar.R= 	Solar Radiation (Langleys)
#Wind= 	Wind speed (mph)
#Temp= 	Temperature (degree F)
#Month= 	Numeric Month (1-12)
#Day	= Numeric Day of month (1-31)


airquality <- read.csv("airquality.csv", header=TRUE)
head(airquality,10)
dim(airquality)




###   remove missing values 
ds<-na.omit(airquality)
head(ds,10)
dim(ds)
names(ds)




###   In the ds dataset, create a new variable called ozone_temp, which is the product of ozone and temperature values
ds$ozone_temp <- ds$Ozone * ds$Temp
head(ds,10)





###   Subsetting observations 
#(Create a new data set called hot with observations from the month of July and where Temp < 85F)
hot <- subset(ds,Month ==7 & Temp < 85)
head(hot)

#or 
hot <- ds[ds$Month ==7 & ds$Temp < 85,]
head(hot)






###   Keeping (Selecting) variables
ds_new <- ds[, c("Ozone", "Temp", "Day")]
head(ds_new)

#or
ds_new <- subset(ds, select= c(Ozone,Temp,Day))
head(ds_new)





###    Dropping variables
ds_new3 <- ds[, c(-3,-5)] 

#or 
ds_new2 <- subset(ds, select = -c(Ozone,Temp,Day))
head(ds_new2)




###   sorting data sets
#sort() can be used to sort a vector
#order() can be used to sort a dataframe
sortds1 <- ds[order(ds$Ozone),  ] # re-sorts the rows by Ozone value (increasing order)
head(sortds1)





###   merge Datasets 

id<-c(1,1,1,3,3,3,2,2,2)
year<-c(2014,2015,2016,2014,2015,2016,2014,2015,2016)
female<-c(0,0,0,1,1,1,0,0,0)
ds1<-data.frame(id,year,female)
ds1

id<-c(2,1,4)
y<-c(24,32,48)
ds2<-data.frame(id,y)
ds2


newds <- merge(ds1, ds2, by="id") #default all=FALSE (only the common IDs) 
newds #use head() for large data sets 
dim(newds)


newds <- merge(ds1, ds2, by="id", all=TRUE) # all IDs. (extra rows will be added to the output for any rows that have no matches in the other dataset)
newds
dim(newds)








