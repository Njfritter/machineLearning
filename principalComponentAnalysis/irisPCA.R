# Doing some more data stuff with the iris data set!!!
# Now we will be performing Principal Component Analysis

# In PCA there are at least two variables (one response variable)
# and for each variable in the model (including the response) there will be a Principle Component model generated. 

# In these models, the first two components (they are linear combinations of dependent variables) 
#in it explain the majority of the variance in the model (up to 95%)


# First let us install these packages
# If you have any of these already downloaded skip the install.packages part
# It will install the package again in a different spot
# Try the require function if you think you might already have the package downloaded


install.packages("data.table")
require(data.table)


install.packages("MASS")
require(MASS)


install.packages("ggplot2")
require(ggplot2)


install.packages("scales")
require(scales)


install.packages("gridExtra")
require(gridExtra)


install.packages("MASS")
require(MASS)


install.packages (“class”)
require(class)


install.packages(“tree”) 
require(tree)


install.packages("GGally")
require(GGally)


install.packages("RGraphics")
require(RGraphics)


install.packages("grid")
require(grid)


install.packages("ROCR")
require(ROCR)



# Now to call up the data set, return the first 6 observations 
# and fetch summary statistics


data(iris)
head(iris)
summary(iris)


# Now let's perform a Principal Compenent Analysis (PCA) on the data 
# First let's change the data into something easier to use (and take a look at it)


iris.data <- data.table(iris[ , 1:4])
iris.data


# We must take out the data on the far right because it is not numerical
# It is the classes we are trying to predict
# Even though it is removed from the algorithm 
# The algorithm will still know what it is trying to predict
# Think of the far right column as "answers" (sample) and from learning
# the different possibilities it will make predictions instead (for population as well)
# Now for the actual PCA:


iris.pca <- prcomp(iris[,1:4], scale =	TRUE, cor = TRUE)


# The first principal component is the linear combination of the dependent variables that has the max variance.
# This component accounts for most of the variance in the model
# The second principal component is the linear combination of the dependent variables 
# that accounts for most of the remaining variance
# The first and second components are orthogonal (meaning the correlation between them is zero)


# We can view this here in the summary statistics


summary(iris.pca)
iris.pca


# The summary outputs the standard deviation of the compenents (four of them here)
# You will also see the proportion of the variance that each component has, so you can see PC 1 & 2 will have the most variance
# Using the cumulative proportion row we see the first two components 
# Account for 96% of the variance


# Now to access the "rotations" of the four PC's


iris.pca$rotation


# Since Principal components in themselves are linear combinations of the explanatory variables
# this output shows essentially the coefficients or "weights" of the linear combinations created by each PC


biplot(iris.pca, scale = 0)


# These plots may be confusing but the data points shown are the projections onthe first and second PC's
# The length of the arrows represent the variance of the variables
# The angle between the arrows represent the correlation between variables


# NOTE: IF YOU WOULD LIKE TO ERASE THE GRAPH HISTORY IN RSTUDIO, USE: dev.off()


# Now outputting the Proportion of variance explained by each principal component 


PVE <- iris.pca$sdev^2/sum(iris.pca$sdev^2)
PVE[1:4]


# Notice the sum of all four PC's is 1, since we created linear combinations that made it so out variance ends up as 1!


# Another way to visualize the eigenvalues corresponding to the components is a scree plot
# Plot shows the components that explain the most variance in a visual way

screeplot(iris.pca, type = "lines", main = "PVE Scree plot of Iris")

