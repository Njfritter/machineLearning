# Hello! 
# Before every machine learning algorithm is implemented
# A good idea is to run general analysis procedures on it
# This is called Exploratory Data Analysis
# Hence the name of the folder *wink wink*


# With the Iris data set we have four attributes:
# Sepal Width, Sepal Length, Petal Width, and Pedal Length
# The classes are: Iris-setosa, Iris-versicolor, Iris-virginica


# First we will run the ggplot function for each length as a function of each width
# There will be four scatterplots total


g1<-ggplot(iris,aes(x=Sepal.Width,y=Sepal.Length, shape=Species, color=Species))
+geom_point(size=2)

g2<-ggplot(iris,aes(x=Petal.Width,y=Petal.Length, shape=Species, color=Species))
+geom_point(size=2)

g3<-ggplot(iris,aes(x=Sepal.Width,y=Petal.Length, shape=Species, color=Species))
+geom_point(size=2)

g4<-ggplot(iris,aes(x=Petal.Width,y=Sepal.Length, shape=Species, color=Species))
+geom_point(size=2)


grid.arrange(g1, g2, g3, g4, nrow = 2, ncol = 2, top = "Scatterplots")


