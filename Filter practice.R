library(tidyverse)
flights <- nycflights13::flights
View(flights)
#it won't work, as filter needs it second argument must return logical value that is T OR F.
filter(flights,carrier)

#filter will check the column carrier and checks for the "B6" character in each row. 
#As, this function will return logical value it will run.
#Only those results will be shown, for which the condition evaluates to TRUE.
filter(flights,carrier=="B6")


#it basically searches content inside the variable name
#numerical values doesn't need any quotes, text does.
filter(flights,flight==507)

#it needs the exact match, in order to be TRUE. It is case sensitive
filter(flights,carrier=="b6")

#when multiple expressions are grouped, it combines them with and operator
#so in this case it will search for a row where b6 and ua are together, which is not the case in this column
filter(flights,carrier=="B6",carrier=="UA")

#when both carrier and flight will be B6 and minute 7, only then Output will be shown.
#Can save the results in a variable
v <- filter(flights,carrier=="B6",minute==7)

#can filter date as well
filter(flights,time_hour=="2013-01-01 05:00:00")

#filtering out carrier UA where minute is not equal to 7
filter(flights,carrier=="UA",minute!=7)

#it will find all the flights having departure delay by one hour or no delay. 
#summation of all those flights having delay
filter(flights,dep_delay==-1|dep_delay==0)

#if values of minutes is in given values?
#it will display for 7 minutes even if there is no row containing 100 minutes
filter(flights,minute%in%c(7,100))

filter(flights,arr_delay>=120)

filter(flights,dest%in%c("IAH","HOU"))

filter(flights,arr_delay>=120&dep_delay<=0)

#cannot apply and operator to a single column only to diff columns
filter(flights,dep_time>=2400&dep_time<=600)

filter(flights,dep_time<=600|dep_time==2400)

x <- c(1,2,3)
y <- c(2,3,4)

#is x in y?
x%in%y

titanic_train <- read.csv("Titanictrain.csv")

#filtering out the pasengers with missing age
filter(titanic_train,Age==is.na(titanic_train$Age))

#children came with the nany 
filter(titanic_train,Parch==0)

#people who didn't survived
filter(titanic_train,Survived==0)

filter(titanic_train,Age<=10&Pclass==1)

#passengers whose name starts with "w"
filter(titanic_train,starts_with("W"))

# arrange on categorical variable
arrange(titanic_train,Name) 

#arranging in descending order
arrange(titanic_train,desc(Name))

#arranged on the basis of first variable name
View(arrange(titanic_train,Name,Age)) 

#can enter the variable name or column number
select(titanic_train,4)

#select column which contains "ge"
select(titanic_train,contains("ge"))

#renaming the variable name
rename(titanic_train,name=Name)

#It will display in the order which we give it to it
select(titanic_train,Age,Survived,PassengerId,Sex,Pclass)

#It will keep these two variables upfront and select remaining ones.
select(titanic_train,Age,Survived,everything())

titanic_train%>%
  filter(Survived==1)%>%filter(Age>50)

#count of sex
table(titanic_train$Sex)

library(dplyr)
#it is used with dplyr only as this function count is from dplyr package
titanic_train%>% count(Sex)

#count from plyr package
#vars for variable for which you want to calcualte frequency
library(plyr)
plyr::count(titanic_train,vars = "Sex")
plyr::count(titanic_train,vars = "Survived")

#using substring
titanic_train %>%
    filter(Survived==1,substr(Name,1,1) == 'A' | substr(Name, 1, 1) == 'B',
           Age>50)

