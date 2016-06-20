# Now we will run one of the simplest machine learning algorithms
# K Nearest Neighbors
# This algorithms makes predictions using certain input variables
# Using training data that is "nearest" to the value you are trying to predict
# Example: I have data for an explanatory variable of 1, 5, 38, 45, 91, 64, 
# 35, 26, and 27 (and then corresponding data for a response variable)
# If I were to try and predict the response variable given an explanatory value# of 31, I would use the response variable values of the "nearest neighbors" of# 26, 27, and 35 (and possibly 38) to predict the value for 31
# So if the "nearest neighbors" had corresponding response variable values of 
# say 101, 108 and 120, respectively then the response variable value would likely be 
# predicted to be somewhere between 108 and 120
# Now let's run this program

require(data.table)

iris.data1 <- data.table(iris)
iris.data1   
# Create a data table

samp_size <- floor(0.80 * nrow(iris.data1))
samp_size
# Get the sample size we are using for the training set

set.seed(112)
# This generates a sequence of random numbers, starting with 112

train_ind <- sample(seq_len(nrow(iris.data1)), size = smp_size)
train_ind
# Create the training sample using the sample size

train <- iris[train_ind, ]
train
# Create a data frame for the training set

train.set <- subset(train, select = -c(V5))
train.set
# Now take away the "Species" column, which is labeled as "V5" if you do not 
# manually change the labels when importing the data
# We will compare the these actual results with the predicted ones

test <- iris[-train_ind, ]
test
# Create the test set from the remaining data in iris

test.set <- subset(test, select = -c(V5))
test.set
# Now take away the "Species" column again, which is labeled as "V5"
# To compare to the predicted values

class <- train[, "Species"]
class
# This will contain the actual flower results

length(class)
knn.iris <- knn(train = train.set, test = test.set,  cl = class, k = 6,  prob = TRUE)
# Now here we use the "knn" function to predict flower types
# We use the traning set to create the algorithm, then use the test set to
# Make predictions of flower types and compare them to "class"
# We use the nearest 6 neighbors to predict each type

test.class <- test[, "V5"]
test.class
# The test data containing the flower types which we will compare to predicted values 

knn(train.set, train.set, class, k= 10)
p.YTest = NULL
Error = NULL
# Here we declare two variables: p.YTest, which utilizes cross validation in 
# k-nearest neighbors between each row of the training set and ITS k nearest 
# training set vectors; the resulting classification is decided by majority vote
# And Error, which is the mean amount of times the actual flower type did not match the predicted

for(i in 1:100){
  set.seed(1)
  p.YTest = knn.cv(train=train.set, cl= class,k=i)
  Error[i] = mean(class != p.YTest)
}
# Now from 1 to 100, we determine the classifications as well as the Error for each value of i

min(Error)
# Show the minimum error value (0.025)

e.r <- which.min(Error)
e.r
# Show the location of the minimum error value (6)

knn.errorplot <- ggplot(data.frame(x = 1:100, y = Error), aes(x = x, y = y)) + geom_line(color = "red") + ggtitle("Error Rates versus K") + labs(x = "Values of K", y = "Test Error Values") + geom_vline(aes(xintercept = e.r)) + geom_hline(aes(yintercept = min(Error)))
# Create an errorplot of Error Rates versus the K values

knn.errorplot
# Now plot it!!!
# As we can see, as the value of K increases (the more neighbors considered)
# The higher the error rate rises

table(test.class, knn.iris)
# Get the prediction accuracy of the algorithm
# Besides for one instance of the algorithm predicting Iris-versicolor when the
# actual class is Iris-virginica, every prediction was correct
# Accuracy: 10/10 for Iris-setosa, 11/11 Iris-versicolor, 8/9 Iris-virginica 