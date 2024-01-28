?read.csv

#Method1 -Reading files manually

data<- read.csv(file.choose())
data

#set the working directory
getwd()

#set the working directory WIndows

#setwd("C:\\Users\\Home\\OneDrive - University of Essex\\Documents\\R\\data")

#MAC
#setwd("/Users/Home")
#Method2
demo_data <- read.csv("Demodata.csv")

demo_data

#exploring the dataset
nrow(demo_data)


#Imported number of rows which is 195


ncol(demo_data)
#top 5 rows
head(demo_data)

#botton rows with tail

tail(demo_data)

str(demo_data)

summary(demo_data)

#Usding dollar sign- Acccess the data in dataframe


head(demo_data)
demo_data[3,3]
demo_data[3,"Internet.users"]


#Extract the vector
demo_data$Country.Code

demo_data$Country.Code[2]


#Used quite a lot in R dealing with dataframes

levels(as.factor(demo_data$Income.Group))


#basic operations in dataframe, we will talk about subsetting


demo_data[1:10,] #subsetting

demo_data[3:9,]


demo_data[c(3,99),]

#how [] work, in matrics to extract first row, and it will turn the row into vectpr
#it doesnt happen in dataframe as rows number is still exist

demo_data[1,]

is.data.frame(demo_data[1,]) #no need to use for drop =F

demo_data[,1]
#we exttrract country name, and it is vector with multiple lines,
is.data.frame(demo_data[,1])
#hence it is not dataframe, so we will try to preserve it, dimensions dropped

demo_data[,1,drop=F]

is.data.frame(demo_data[,1,drop=F])
#always check whtat you are working with 



#Multipply columns

demo_data$Birth.rate*demo_data$Internet.users

demo_data$Birth.rate+demo_data$Internet.users



#Adding a column into dataframe, we need to pretend that col exist

demo_data$newcolProd <-demo_data$Birth.rate*demo_data$Internet.users

demo_data
#Everything is happening on a vector rule, vec mltiplied by vec


#let us see what you learnt


#Removing a column

demo_data$newcolProd<-NULL

demo_data

#Filtering a dataframes------------------------------------



head(demo_data)
demo_data$Internet.users
#Let us fnd out internet users watching less than2

fiter<- demo_data$Internet.users<2# this is a vector


demo_data[1:10,]
demo_data[fiter,]


#Internet is not widersperad and really less population is watching





#Country that birth rate is above 40, we will not create filter


demo_data[demo_data$Birth.rate>40,]
#above countries have growth rate above 40


#Now we will add a nother coindition internet users less than 2


demo_data[demo_data$Birth.rate>40 & demo_data$Internet.users <2,]

#Filter with categorical variable which is income group
demo_data
demo_data[demo_data$Income.Group =="Low income",]


#Information from China

demo_data[demo_data$Country.Name=="China",]


# Visualizing our results using Q plots
?qplot

#install.packages("ggplot2")
library(ggplot2)
?qplot
#PLotting internet users as labels and count is adding , grid and bins are selected automatically

qplot(data=demo_data,x=Internet.users)


qplot(data=demo_data,x=Income.Group,y=Birth.rate  )


qplot(data=demo_data,x=Income.Group,y=Birth.rate,size=I(2),colour=I("blue") )


#representation of the distribution of a dataset. It provides a visual summary of key statistical measures such as the minimum, first quartile (Q1), median, third quartile (Q3), and maximum

qplot(data=demo_data,x=Income.Group,y=Birth.rate,size=I(1),geom="boxplot" )



##-- Visualization with Q plot , what we need

qplot(data=demo_data,x=Internet.users,y=Birth.rate)


qplot(data=demo_data,x=Internet.users,y=Birth.rate,size=I(3),color=I("red"))


#Cateogorie based upon income group

qplot(data=demo_data,x=Internet.users,y=Birth.rate,size=I(3),color=Income.Group)



#Analysis, how many childer born every year, High incomes are watchng more internet access
#Birth rate is quite low for them
#Shows that there is correlation and people have no time for internet looks bit funny though




#We have not learnt how to create dataframes , scatterplot showing birth
#rate and internet users by countries, scatterplots need to be categorised by Country refions


Countries_2012_Dataset <- c("Aruba","Afghanistan","Angola","Albania","United Arab Emirates","Argentina","Armenia","Antigua and Barbuda","Australia","Austria","Azerbaijan","Burundi","Belgium","Benin","Burkina Faso","Bangladesh","Bulgaria","Bahrain","Bahamas, The","Bosnia and Herzegovina","Belarus","Belize","Bermuda","Bolivia","Brazil","Barbados","Brunei Darussalam","Bhutan","Botswana","Central African Republic","Canada","Switzerland","Chile","China","Cote d'Ivoire","Cameroon","Congo, Rep.","Colombia","Comoros","Cabo Verde","Costa Rica","Cuba","Cayman Islands","Cyprus","Czech Republic","Germany","Djibouti","Denmark","Dominican Republic","Algeria","Ecuador","Egypt, Arab Rep.","Eritrea","Spain","Estonia","Ethiopia","Finland","Fiji","France","Micronesia, Fed. Sts.","Gabon","United Kingdom","Georgia","Ghana","Guinea","Gambia, The","Guinea-Bissau","Equatorial Guinea","Greece","Grenada","Greenland","Guatemala","Guam","Guyana","Hong Kong SAR, China","Honduras","Croatia","Haiti","Hungary","Indonesia","India","Ireland","Iran, Islamic Rep.","Iraq","Iceland","Israel","Italy","Jamaica","Jordan","Japan","Kazakhstan","Kenya","Kyrgyz Republic","Cambodia","Kiribati","Korea, Rep.","Kuwait","Lao PDR","Lebanon","Liberia","Libya","St. Lucia","Liechtenstein","Sri Lanka","Lesotho","Lithuania","Luxembourg","Latvia","Macao SAR, China","Morocco","Moldova","Madagascar","Maldives","Mexico","Macedonia, FYR","Mali","Malta","Myanmar","Montenegro","Mongolia","Mozambique","Mauritania","Mauritius","Malawi","Malaysia","Namibia","New Caledonia","Niger","Nigeria","Nicaragua","Netherlands","Norway","Nepal","New Zealand","Oman","Pakistan","Panama","Peru","Philippines","Papua New Guinea","Poland","Puerto Rico","Portugal","Paraguay","French Polynesia","Qatar","Romania","Russian Federation","Rwanda","Saudi Arabia","Sudan","Senegal","Singapore","Solomon Islands","Sierra Leone","El Salvador","Somalia","Serbia","South Sudan","Sao Tome and Principe","Suriname","Slovak Republic","Slovenia","Sweden","Swaziland","Seychelles","Syrian Arab Republic","Chad","Togo","Thailand","Tajikistan","Turkmenistan","Timor-Leste","Tonga","Trinidad and Tobago","Tunisia","Turkey","Tanzania","Uganda","Ukraine","Uruguay","United States","Uzbekistan","St. Vincent and the Grenadines","Venezuela, RB","Virgin Islands (U.S.)","Vietnam","Vanuatu","West Bank and Gaza","Samoa","Yemen, Rep.","South Africa","Congo, Dem. Rep.","Zambia","Zimbabwe")
Codes_2012_Dataset <- c("ABW","AFG","AGO","ALB","ARE","ARG","ARM","ATG","AUS","AUT","AZE","BDI","BEL","BEN","BFA","BGD","BGR","BHR","BHS","BIH","BLR","BLZ","BMU","BOL","BRA","BRB","BRN","BTN","BWA","CAF","CAN","CHE","CHL","CHN","CIV","CMR","COG","COL","COM","CPV","CRI","CUB","CYM","CYP","CZE","DEU","DJI","DNK","DOM","DZA","ECU","EGY","ERI","ESP","EST","ETH","FIN","FJI","FRA","FSM","GAB","GBR","GEO","GHA","GIN","GMB","GNB","GNQ","GRC","GRD","GRL","GTM","GUM","GUY","HKG","HND","HRV","HTI","HUN","IDN","IND","IRL","IRN","IRQ","ISL","ISR","ITA","JAM","JOR","JPN","KAZ","KEN","KGZ","KHM","KIR","KOR","KWT","LAO","LBN","LBR","LBY","LCA","LIE","LKA","LSO","LTU","LUX","LVA","MAC","MAR","MDA","MDG","MDV","MEX","MKD","MLI","MLT","MMR","MNE","MNG","MOZ","MRT","MUS","MWI","MYS","NAM","NCL","NER","NGA","NIC","NLD","NOR","NPL","NZL","OMN","PAK","PAN","PER","PHL","PNG","POL","PRI","PRT","PRY","PYF","QAT","ROU","RUS","RWA","SAU","SDN","SEN","SGP","SLB","SLE","SLV","SOM","SRB","SSD","STP","SUR","SVK","SVN","SWE","SWZ","SYC","SYR","TCD","TGO","THA","TJK","TKM","TLS","TON","TTO","TUN","TUR","TZA","UGA","UKR","URY","USA","UZB","VCT","VEN","VIR","VNM","VUT","PSE","WSM","YEM","ZAF","COD","ZMB","ZWE")
Regions_2012_Dataset <- c("The Americas","Asia","Africa","Europe","Middle East","The Americas","Asia","The Americas","Oceania","Europe","Asia","Africa","Europe","Africa","Africa","Asia","Europe","Middle East","The Americas","Europe","Europe","The Americas","The Americas","The Americas","The Americas","The Americas","Asia","Asia","Africa","Africa","The Americas","Europe","The Americas","Asia","Africa","Africa","Africa","The Americas","Africa","Africa","The Americas","The Americas","The Americas","Europe","Europe","Europe","Africa","Europe","The Americas","Africa","The Americas","Africa","Africa","Europe","Europe","Africa","Europe","Oceania","Europe","Oceania","Africa","Europe","Asia","Africa","Africa","Africa","Africa","Africa","Europe","The Americas","The Americas","The Americas","Oceania","The Americas","Asia","The Americas","Europe","The Americas","Europe","Asia","Asia","Europe","Middle East","Middle East","Europe","Middle East","Europe","The Americas","Middle East","Asia","Asia","Africa","Asia","Asia","Oceania","Asia","Middle East","Asia","Middle East","Africa","Africa","The Americas","Europe","Asia","Africa","Europe","Europe","Europe","Asia","Africa","Europe","Africa","Asia","The Americas","Europe","Africa","Europe","Asia","Europe","Asia","Africa","Africa","Africa","Africa","Asia","Africa","Oceania","Africa","Africa","The Americas","Europe","Europe","Asia","Oceania","Middle East","Asia","The Americas","The Americas","Asia","Oceania","Europe","The Americas","Europe","The Americas","Oceania","Middle East","Europe","Europe","Africa","Middle East","Africa","Africa","Asia","Oceania","Africa","The Americas","Africa","Europe","Africa","Africa","The Americas","Europe","Europe","Europe","Africa","Africa","Middle East","Africa","Africa","Asia","Asia","Asia","Asia","Oceania","The Americas","Africa","Europe","Africa","Africa","Europe","The Americas","The Americas","Asia","The Americas","The Americas","The Americas","Asia","Oceania","Middle East","Oceania","Middle East","Africa","Africa","Africa","Africa")


#Let us build a dataframe from the data, we have vectors

new_df=data.frame(Countries_2012_Dataset,Codes_2012_Dataset,Regions_2012_Dataset)

head(new_df)

colnames(new_df)<- c("Country","Code","Region")

colnames(new_df)


#Remove
rm(new_df)
new_df<-data.frame(Country=Countries_2012_Dataset,Code=Codes_2012_Dataset,Region=Regions_2012_Dataset)
head(new_df)


summary(new_df)

#-- Merging dataframes


head(demo_data)
head(new_df)


#we need to color based upon region, challenge is how to combine it 


#we have country name and it is the only way we will merge it and match by country
#would recommend using country code as there are not much space you could find

merge_df<- merge(demo_data,new_df,by.x="Country.Code",by.y="Code")





head(merge_df)
#R knows that it will not include the duplicate y column and makes no senese

merge_df$Country<- NULL

merge_df

str(merge_df)

#Visualization using Region Now


qplot(data=merge_df,x=Internet.users,y=Birth.rate)

qplot(data=merge_df,x=Internet.users,y=Birth.rate, colour=Region)

#Change the shapes , 0 to 25 shapes, there are hollow shapes
qplot(data=merge_df,x=Internet.users,y=Birth.rate, colour=Region, shape=I(17))

#Transparency


qplot(data=merge_df,x=Internet.users,y=Birth.rate, colour=Region, shape=I(17),alpha=I(0.5))


#Title

qplot(data=merge_df,x=Internet.users,y=Birth.rate, colour=Region, shape=I(17),alpha=I(0.5), main="Birth Rate VS Internet Users ")




