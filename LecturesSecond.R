x<-matrix(nrow=4,ncol=2,data=c(1,2,3,4,5,6,7,8))
x

#helps to get the dimension of matrix
dim(x)       

nrow(x)

ncol(x)

#what type of variable we are holding, informs the type of object
#ors torage mode of object
mode(x)

#atributes provides attributes of obejct

attributes(x)# information of dimensions of matrix




#How matrix can be created, but would like to know general command
#options available 


#Identiyy matrix diagonals are 1 and reaminings are 0

d<-diag(1,nrow=2,ncol=2)

d

#data arraanged differently n the row format
x1<-matrix(nrow=4, ncol=2,data=1:8, byrow=T)
x1
#Transpose of matrix
xt<- t(x1)

xt



file1<-read.csv('File.csv')

View(file1)


write.csv(file1,file="Export.csv")

