# Coding Basics - Session 2 - Worksheet 

# Package Loading 
library(tidyverse) 

# Section 1.1: Components of Code 

## Run the following code to load in the data ready for some future exercises
## Please note, that the file name may be something different for you! 

data <- read.csv(file = "data/welshgov_data.csv")

## Now we can run some code to see if it is what we are expecting:

## Lets see if this is a dataframe? 
class(data)


# Section 1.2: Components of Scripts / Files 

## Now try to run the example script manually or using: 

source("example_script.R") 

## What happens? 

# Section 2: Data in R

# Exercise 1: View the current dataset (data) 
# For this, we can use the GUI, or functions such as View(), head() or tail() 

View(??)
head(??) 
tail(??)

# Exercise 2: Examine the dataframe in more detail, determining what is in each column 
# Exercise 2a: Use the str() function, to examine its structure 

str(??)

# Exercise 2b: Use ncol() and nrow(), to examine the number of rows/columns 

ncol(??)
nrow(??)

# Exercise 2c: Get a summary of the entire dataframe using summary() 

summary(??)

# From this we can see that all variables (with the exception of data values)
# Are character classes, which is not useful when trying to understand the data. 






