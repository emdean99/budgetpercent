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
library(qmrparser)

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
  
  budget_thinned <- str_extract_all(budget_numbers[ , 1], '\\d+')
  
}


# Check the type of data output

typeof(budget_thinned)

# Make sure it is a data frame and name the column

budget_thinned <- data.frame(cbind(budget_thinned))

# Name the further Column for Analyzing

colnames(budget_thinned) <- 'Percentt'

# Try to get either numbers or an NA 

budget_final <- budget_thinned[!is.na(as.numeric(as.character(budget_thinned$Percent))),]

# Check budget_final to make sure it can be graphed

typeof(budget_final)

# Coerce to be a dataframe

budget_final <- as.data.frame(budget_final)

# Verify it worked

typeof(budget_final)

# Pull out the relevant numbers

budget_percents <- as.data.frame(budget_final[,])

# Switch so it can be easily graphed

budget_transpose <- as.data.frame(t(budget_percents))

# Add in a column of numbers so that easier to graph
# In this step we are also only pulling out the percents
# As numeric to make it graphable

budget_transpose <- data.frame(Count = 1:nrow(budget_transpose), 
                               Percent = as.numeric(budget_transpose[,1]))



# Set the final variable for graphing

budget_graphable <- budget_transpose


# Now that the data has been collected and gotten in a df, it can be analyzed
# both in a graphical and a number/statistical form
###############################################################################
#-------------------------------------------------------------------------------
# Graph the data in a histogram

histo_budget <- ggplot(data = budget_graphable,
         mapping = aes(y = Percent)) + geom_histogram()



print(histo_budget)


# Pull out the status

budget_stats <- summary(budget_graphable)


     
  