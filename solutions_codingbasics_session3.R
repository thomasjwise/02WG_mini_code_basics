# Coding Basics - Session 3 - Worksheet 

# Package Loading 
library(tidyverse) 

# Reload the data in: 

data <- read.csv(file = "data/welshgov_data.csv")


#### Section 1.2: Changing Column Names ####
# Exercise 1: Renaming data columns 
# Exercise 1a: Identify the column names of the dataset 

# We can use the colnames function to first identify the names of columns 
colnames(data)

# When we evaluate the names of the presented columns, we can see identify the naming convention! 

# Exercise 1b: Rename the 'Data.values' column, to 'Number.of.activities'
# Hint you can use the rename() function 

# In this case we can see that the data.description column describes the data.values column. 
data <- rename(data, Number.of.activities = Data.values)

# Exercise 1c: Using colnames again, check the column names of this dataset. 

colnames(data)

#### Section 1.3: Transforming Variables ####

# Exercise 2: Identifying Variable Types 
# Exercise 2a: Using the summary() function, identify, which columns could be changed to:
  # 1: Numerical Variables
      # Number.of.Activities 
  # 2: Factor Variables 
      # Data.description, Academic.year, Mode.of.programme, Home.region, Standardised.activity,
      # Age.group, Activity.level, Welsh.fluency, Medium.of.delivery

summary(data)

# Exercise 2b: Alternatively, to check specific ones you can use the class function
  # Using class(), check the variable type of Academic.year

class(data$Academic.year)

# Exercise 3: Transforming Variable Types 
  # Now we know what variable types we are looking for, we can individually transform them. 

# Exercise 3a: Initially, transform our newly named `Number.of.activities` column from Int to Numeric
data$Number.of.activities <- as.numeric(data$Number.of.activities)

# Exercise 3b: Next, following the same format, complete the relevant transformations for the remaining columns 
#data$ <- as.??(data$??)

# Data.description, Academic.year, Mode.of.programme, Home.region, Standardised.activity,
# Age.group, Activity.level, Welsh.fluency, Medium.of.delivery

data$Data.description <- as.factor(data$Data.description)
data$Academic.year <- as.factor(data$Academic.year)
data$Mode.of.programme <- as.factor(data$Mode.of.programme)
data$Home.region<- as.factor(data$Home.region)
data$Standardised.activity <- as.factor(data$Standardised.activity)
data$Age.group <- as.factor(data$Age.group)
data$Activity.level <- as.factor(data$Activity.level)
data$Welsh.fluency <- as.factor(data$Welsh.fluency)
data$Medium.of.delivery <- as.factor(data$Medium.of.delivery)

# Exercise 3c: Finally, we can now use the summary function again to review the dataset 
summary(data)

#### Section 1.4: Manipulating Data ####

# Exercise 4: Selecting Specific Columns 
# Exercise 4a: We can see from the summary function, that a number of columns now hold little value. 
  # So lets drop the columns called: "Data.description" and "Notes" using select

# Example using Notes column:
data <- select(data, !Notes)

# Now repeat this, dropping the Data.description column
data <- select(data, !Data.description)

# Exercise 5: Further Manipulation!

# Exercise 5a: Now we have set some variables to factors, lets look at their levels 
  # We can do this using the summary() function, but also through the levels() function

# Using the levels function, evaluate how many levels does a specific column have? 
levels(data$Age.group)

# Exercise 5b: Lets now look to split our complex dataset into more smaller subsets 
  # For this, lets use the split() function to divide the data into groups of years

data_list_year <- split(data, data$Academic.year)

# Exercise 5c: Next we can examine this list using summary()
summary(data_list_year)
summary(data_list_year$`2016-17`)

# Exercise 5d: In order to make this manageable, we have to use the list2env() function to divide this up! 
list2env(data_list_year, envir = .GlobalEnv)

# Exercise 5e: Lets choose a year, say `2016-17` and subset by Mode
# We can use the subset() function to look at only the "Apprenticeship" group. 

data_201617_apprenticeships <- subset(`2016-17`, Mode.of.programme == "Apprenticeships")

# Exercise 5f: However we can also subset by multiple groups.
# In this instance, split the same dataset (`2016-17`), by all those under 20 

data_201617_under20 <- subset(`2016-17`,
                              Age.group == "16" |
                              Age.group == "17" |
                              Age.group == "18" |
                              Age.group == "19" )

# Exercise 6: Clean up! 
# It is always important to clean up your data accordingly. 
# In this case, we can use droplevels() to remove unused levels in our subsetted data.

data_201617_under20 <- droplevels(data_201617_under20)

# Exercise 7: Combining Datasets by Rows
# Using the bind_rows() function, we can join together dataframes vertically. 
# This allows us to rejoin dataframes. 
# In this case, rejoin the years 2016-17, 2017-18 and 2018-19

data_2016to19 <- bind_rows(`2016-17`, `2017-18`, `2018-19`)
