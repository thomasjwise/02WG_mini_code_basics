# This is an example script. 
# Please note, it is expected that this will throw and error, and be unable to run. 

## Load the tidyverse package
library(tidyverse)
print("tidyverse is loaded")

## Load in this temporary data 
temp_data <- mpg
print("mpg data is loaded")

## Run a simple descriptive statistic measure
mean_mpg <- mean(mpg$hwy)
print(paste0("MPG mean is: ", round(mean_mpg, 2)))

## This will throw an error
summary(empty_data)
      