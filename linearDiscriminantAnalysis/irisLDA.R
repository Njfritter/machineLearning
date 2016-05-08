# For this project, I will be performing Linear Discriminant Analysis on the Iris data set from the UCI Machine Learning database
# This will be one of the easier data sets to perform analysis on
# Soon to come will be an explanation on why LDA was chosen for this data set
# The link to the data set can be found here:

# http://archive.ics.uci.edu/ml/datasets/Iris

# This data set contains information on sepal length, sepal width, petal length, and petal width. 
# Those are the attributes. The classes are Iris Setosa, Iris Versicolour, and Iris Virginica


# STEP ONE:
# Now with R Studio open, go to "Import Dataset" and choose "From Web Url"
# Copy and paste URL above
# All the default options are correct so hit "Import" 

iris <- read.csv("/var/folders/xr/ykjyy2_n71n7rmxhgnytgv0r0000gn/T//Rtmpvdmu1Z/data2c3775abdd7", header=FALSE)
View(iris)

# Above is what should output to the Console
# You will automatically view the data set above the console


# STEP TWO:
# Now to bring in the required library

library(MASS)

# This will enable the required functions necessary to perform linear and quadratic discriminnant analysis


# STEP THREE:
# LDA can be as simple as...

fitlda <- lda(V5 ~ V1 + V2 + V3 + V4, data = iris, na.action = "na.omit", CV = TRUE)

# V5 represents the different classes of Iris Flower
# V1 represent the attributes mentioned in the beginning in that order
# These are default column names given to data sets


# STEP FOUR:
# We will create a table that will show the accuracy of each prediction
# And print it out with the second command

correct <- table(iris$V5, fitlda$class)

diag(prop.table(correct, 1))

# According to the output: 
# Iris-Setosa was predicted with 100% accuracy
# Iris-versicolor was predicted with 96% accuracy
# Iris-virginica was predicted with 98% accuracy 


# STEP FIVE:
# Find the total percent correct

sum(diag(prop.table(correct)))

# Output should read 98% accuracy 


# Outline of this process in R can be found here:
http://www.statmethods.net/advstats/discriminant.html
# More LDA programs and stuffs to come!