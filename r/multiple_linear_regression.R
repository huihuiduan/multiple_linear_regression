################################################################################
# File Name: multiple_linear_regression.R
# Project: Linear regression with multiple variables
# Objective: Implement Gradient Descent algorithm to multiple linear regression

# Author: Huihui Duan

# First Created: Sep/10/2013
# Last Modified: Jan/18/2015

# Usage: 
# /usr/bin/Rscript multiple_linear_regression.R arg1 arg2 arg3
# arg1 - training.txt - training data set (no col names, last column as output)
# arg2 - testing.txt - testing data set (no col names)
# arg3 - prediction.txt - prediction of testing data set
################################################################################

# Setup arguments in command line
args <- commandArgs(TRUE)

###################### Pat 1: Train the data ####################
# Read training data set: no hearder, "," separated and no quotes
training <- read.table(file = args[1], header = FALSE, sep = ",", quote = "")
cols <- ncol(training)
# Get the last column as output
Vn <- paste("V", cols, sep = "")
my_formula <- formula(paste(Vn, "~ ."))

##################### Pat 2: Build the model ####################
# Build the linear regression model
model <- lm(my_formula, data = training)

#################### Pat 3: Predict the test ####################
# Read the testing data set: no header, "," separated and no quotes
testing <- read.table(file = args[2], header = FALSE, sep = ",", quote = "")
# Predict the output with model
predict <- predict(model, testing)
# Write the ouput the a file
write(predict, file = args[3], ncolumns = 1)
