p<-matrix(0,2,2)
p[1,1]<-0.25
p[2,1]<-0.75
p[1,2]<-0.40
p[2,2]<-0.60
n<-matrix(0,2,1)
n[1,1]<-50
n[2,1]<-50
cat("Initial pops",n,"\n")
for (i in 1:200) {
  n<-p%*%n }
cat("Final pops",n,"\n")
