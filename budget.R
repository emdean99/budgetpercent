# This script will be used to import informatin that was collected in the parks
# survay regarding what percentage of people think the budget should be
# It will import the data and clean it up, then graphing the data as 
# A histagram and showing some statistics like average 

###############################################################################
-------------------------------------------------------------------------------



#Import Libraries
library(ggplot2)
library(stringr)
library(broom)
library(tidymodels)
library(dplyr)

# First, import the data into a dataframe

budget_raw <- read.csv('budget.csv')

# Create a new dataframe for the numbers

budget_numbers <- data.frame()

# get only the column that includes the numbers in a dataframe

for (i in 1:nrow(budget_raw)) {
  
  budget_numbers[i,1] <- budget_raw[i, 3]
  
}


# create a dataframe that is for the analyzed data

budget_analyzed <- data.frame()

# Create a loop that removes the responses that are not helpful and are not
# Numbered percents

for (i in 1:nrow(budget_numbers)) {
  
  budget_analyzed <- str_extract_all(budget_numbers[ , 1], '\\d+')
  
}


# Check the type of data output

typeof(budget_analyzed)

# Make sure it is a data frame

budget_analyzed <- data.frame(cbind(budget_analyzed))

# Name the columns

colnames(budget_analyzed) <- "Percent"


# Now that the data has been collected and gotten in a df, it can be analyzed
# both in a graphical and a number/statistical form
###############################################################################
-------------------------------------------------------------------------------
# Graph the data in a histogram

ggplot(budget_analyzed, aes(count, frequency)) + geom_histogram()


     
  