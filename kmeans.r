#Remove list of objects
rm(list=ls())

#cluster-01
cluster<-read.csv("IBM_Employee_Attrition_V2.csv", na.strings="?")
cluster
View(cluster)

cluster$Gender<-as.numeric(cluster$Gender)

cluster2<-na.omit(cluster)
View(cluster2)

num_gen<-as.numeric(cluster$Gender)

cluster_dist<- dist(cluster2[,c(8,5,13)])
cluster_dist

?cutree()

hclust_cluster<-hclust(cluster_dist, method='average')
hclust_2<-cutree(hclust_cluster, 2)
hclust_2

table(Hclust=hclust_2,Actual=cluster2[,2])



#cluster-02

kmeans_2<- kmeans(cluster2[,c(8,5,13)],2,nstart = 10)
str(kmeans_2)
kmeans_2$cluster
table(kmeans_2$cluster,cluster2[,2])
