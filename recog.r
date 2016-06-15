library(randomForest)
#library("caret")
#library("rpart")
#library("e1071")
#library(readr)

set.seed(0)

numTrain <- 10000
numTrees <- 25

train <- read.csv(file="/Users/raghuramdharanipathy/Documents/Kaggle/Digit_Recog/train_recog.csv")
test <- read.csv(file="/Users/raghuramdharanipathy/Documents/Kaggle/Digit_Recog/test_recog.csv")

#rows_test <- sample(1:nrow(test), numTrain)
#labels_test <- as.factor(test[rows_test,1])
#test <- train[rows_test,-1]

rows <- sample(1:nrow(train), numTrain)
labels <- as.factor(train[rows,1])
train <- train[rows,-1]
rf <- randomForest(train, labels, xtest=test, ntree=100)
predictions <- data.frame(ImageId=1:nrow(test), Label=levels(labels)[rf$test$predicted])
#fol <- formula(labels ~ ., data=train)
#sv <- svm(fol, data=train)

#svm.pred <- predict(sv, test)
head(predictions)
#head(svm.pred)
write.csv(predictions[c(1,2)], "/Users/raghuramdharanipathy/Documents/Kaggle/Digit_Recog/result_rF_benchmark.csv") 
