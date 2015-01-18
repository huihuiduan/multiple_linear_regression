################################################################################
# File Name: multiple_linear_regression.py
# Project: Linear regression with multiple variables
# Objective: Implement Gradient Descent algorithm to multiple linear regression

# Author: Huihui Duan
# First Created: Sep/10/2013
# Last Modified: Jan/18/2015

# Usage: 
# python multiple_linear_regression.py arg1 arg2 arg3
# arg1 - training.txt - training data set (no col names, last column as output)
# arg2 - testing.txt - testing data set (no col names)
# arg3 - prediction.txt - predictions of testing data set
################################################################################

#!/usr/bin/python
import sys
import numpy as np
from sklearn import linear_model

#################### Pat 1: Train the data ####################
# Read training data set: no hearder, "," separated and no quotes
training = np.genfromtxt(sys.argv[1], delimiter= ',')
X_training = training[:, [0, training.shape[1] - 2]]
y_training = training[:, training.shape[1] - 1]

#################### Pat 2: Build the model ####################
# Create linear regression object
regr = linear_model.LinearRegression()
# Train the model using the training sets
regr.fit(X_training, y_training)

#################### Pat 3: Predict the test ####################
# The coefficients
# print('Coefficients: \n', regr.coef_)
# print('Intercept: \n', regr.intercept_)
# Read the testing data set: no header, "," separated and no quotes
testing = np.genfromtxt(sys.argv[2], delimiter= ',')
# Predict the output and save it to a file
np.savetxt(fname = sys.argv[3], X = regr.predict(testing), fmt='%.6e')