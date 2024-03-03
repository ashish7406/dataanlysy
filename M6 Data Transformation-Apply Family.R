## HAndling the missing values , Outliers.
#1. Remove.
#2. Fill using Mean, Median, Mode
#3. Flooring / Capping
## Transforming Data
#
#
#
#
setwd("D:/00_ML_Courses/R Course/Course notebooks")
getwd()
bd = read.csv("bank-full.csv", sep=',', stringsAsFactors =F )
head(bd,5)
library(dplyr)
glimpse(bd)

#bd is created as dataframe
class(bd)
#here each cateogry how much rows we are having with the help of tab;e, there are 288 as unknown
table(bd$job)
bd$marital

#bd = read.csv("bank-full.csv", stringsAsFactors =F ,na.strings = "unknown")
#sum(is.na(bd$job))



#transformation: when you to apply transformation on the entire datasets

for(i in 1:ncol(mtcars)){
  print(mean(mtcars[,i]))
}

apply(mtcars,2,mean)             #(row:1,col:2)

#Next understand lapply function,
x = round(rnorm(10),2)
x
lapply(x,log10)
#same thing can be achieved using log functionchatlapply 
log(x)

#read different files fpr eaxample

fnames = list.files(path="filenames/", pattern = "*.txt")
fnames
setwd("C:\Users\Home\OneDrive - University of Essex\Documents\R\data\filenames")
files = lapply(fnames, read.csv,header=F,stringsAsFactors=F)
files

#file = do.call(rbind,files)
#file

# sapply will give you n vector form while lapply will give you results in list form
x =sapply(x,log10)
class(x)

temps = data.frame(days=c(1:6),
                   T1=runif(6, min=10,max=50),
                   T2=runif(6, min=10,max=50),
                   T3=runif(6, min=10,max=50))
temps
temps$max_tmp = apply(temps,1,max)#apply on rows
head(temps)
#calclate upper limit for each columns
otlr_upr = function(x){
  m = mean(x)
  s =sd(x)
  return(m+(3*s))
}

apply(mtcars,2,otlr_upr)
#running on entire x and finding when it is greater and take sum of all values
#apply(mtcars,2, function(x) sum(x>otlr_upr(x)))

#tapply takes vector , index and function
tapply(mtcars$mpg, tapply$cyl, mean)
apply(mtcars,2,function(x) tapply(x, mtcars$cyl, mean))


#new dataset
library(vcd)
install.packages("vcd")
Arthritis
Arthritis$new = log(Arthritis$Age) 
head(Arthritis,5)
Arthritis$ageFlag = ifelse(Arthritis$Age>40,1,0)
#alternatively you can use as numeric
Arthritis$ageFlag = as.numeric(Arthritis$Age>40)
head(Arthritis,5)



Arthritis$n_age = ifelse(Arthritis$Age>40,Arthritis$Age,40)
head(Arthritis,5)

#df = data.frame(month=c(1:12),
#                sales=runif(12,min=1000,max =10000))
#head(df)

library(dplyr)
#achieve transformtation
# Filter : filtering rows
# select : selecting columns
# mutate : add / modify columns
# summarise : collapsing, grouping
# arrange : sorting
install.packages("hflights")

library(hflights)
data("hflights")
head(hflights)
#tbl_df converts into more readbale format which is first function tbl_df
flights = tbl_df(hflights)
flights


flights[flights$Month==1 & flights$DayofMonth==1,]
filter(flights,Month==1 , DayofMonth==1)


filter(flights, UniqueCarrier=="AA" | UniqueCarrier=="UA")
filter(flights, UniqueCarrier %in% c("AA","UA"))



flights[,c("Year", "Month", "DayofMonth" ,"DayOfWeek","Diverted")]

select(flights, Year:DayOfWeek,FlightNum)
select(flights, Year:DayOfWeek,FlightNum, contains("Taxi"),contains("Delay"))
#starts_with(), ends_with()

select(flights, -(Year:DayOfWeek))
filter(select(flights, Year:DayOfWeek,FlightNum, contains("Taxi"))
       ,Month==1 , DayofMonth==1)

flights %>%
select(Year:DayOfWeek,FlightNum, contains("Taxi"))%>%
  filter( DayofMonth==1) %>%
    arrange(DayOfWeek)

flights%>%
  select(Distance,AirTime)%>%
   mutate(Speed = Distance /(AirTime*60))

flights%>%
  select(Distance,AirTime)%>%
  mutate(Speed = Distance /(AirTime*6))

flights%>%
  group_by(Dest)%>%
  summarise(avg_delay = mean(ArrDelay,na.rm=T))

flights%>%
  group_by(Month,DayofMonth)%>%
  summarise(flight_count = n()) %>%
  arrange(desc(flight_count))

flights%>%
  group_by(Month,DayofMonth)%>%
  tally(sort = T)

library(hflights)
data("hflights")
head(hflights)
library(dplyr)
flights = tbl_df(hflights)
flights

###destination - Flight count - # planes
flights %>%
  group_by(Dest) %>%
   summarise(Flight_count=n(), plane_count = n_distinct(TailNum))


#Dest , Cancelled_count, Not_cancelled_cnt
flights %>%
  group_by(Dest) %>%
  select(Cancelled)%>%
  table()



#Month , flight_count, Delta_flight_Count  -- (Lag)
flights %>%
  group_by(Month) %>%
   tally() %>%
  mutate(flight_cnt=n,
         Delta_flight_Count = n -lag(n))

flights %>%
  group_by(Month) %>%
  summarise(flight_cnt = n()) %>%
  mutate(
    Delta_flight_Count = flight_cnt -lag(flight_cnt))

str(flights)
glimpse(flights)

#########################################################
################### Reshape DF ###################
# student s1 s2 s3 s4.....
# 
# 
# student subject marks
# dfsd    s1
# dds     S2
# sd
# 
# reshape2:: MELT, DCAST
# tidyr    pivot_longer(), pivot_wider()

install.packages(c("reshape2","tidyr","dplyr"))
library(reshape2)
library(tidyr)

df = data.frame(
  std_id = c(1:20),
  Marks_English = as.integer(runif(20,min=0, max=100)),
  Marks_Maths = as.integer(runif(20,min=0, max=100)),
  Marks_IT = as.integer(runif(20,min=0, max=100)),
  Marks_Physics = as.integer(runif(20,min=0, max=100)),
  Marks_Chemistry = as.integer(runif(20,min=0, max=100)),
  grade = sample(c('A','B','C','F'),20,replace = T)
)

mlted = melt(df,id=c("std_id","grade"),variable.name ='Subject',value.name = 'Marks')
mlted

dcast(mlted,formula = std_id+grade~...)

dcast(mlted,formula = ...~Subject)

dcast(mlted,formula = std_id+grade~Subject)

dcast(mlted,formula = grade~Subject, fun.aggregate = mean)
dcast(mlted,formula = grade~Subject, fun.aggregate = min)

# tidyr    pivot_longer(), pivot_wider()
pivot_longer(df,cols = c("Marks_English","Marks_Maths",
                         "Marks_IT" ,"Marks_Physics",
                         "Marks_Chemistry"),
             names_to = "Subject", values_to = "MArks"

             )
colnames(df)

pivot_longer(df,cols = starts_with("Marks_"),
             names_to = "Subject", values_to = "MArks",
             names_prefix = "Marks_"
)


library(dplyr)
glimpse(billboard)

billboard %>%
  pivot_longer(cols = starts_with("wk"),
               names_prefix='wk',names_to = "Week",
               values_to = "Rank", values_drop_na = T)

pivot_wider(mlted,id_cols = c("std_id","grade"),
            values_from = "Marks",names_from = "Subject")

fish_encounters%>%
  pivot_wider(id_cols = fish,names_from=station,values_from = seen,
              values_fill=0)


us_rent_income%>%
  pivot_wider(id_cols = c("GEOID", "NAME"),names_from=variable,
              values_from =c(estimate,   moe),
              names_sep = ".")
























































































