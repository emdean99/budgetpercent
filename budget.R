# This script will be used to import informatin that was collected in the parks
# survay regarding what percentage of people think the budget should be
# It will import the data and clean it up, then graphing the data as 
# A histagram and showing some statistics like average 

###############################################################################
-------------------------------------------------------------------------------


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

for (i in 1:nrow(budget_numbers) {
  
  
}
     
  