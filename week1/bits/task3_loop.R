# Achieve task 3 with a loop

# set working directory 
# you will need to modify it to point to your data
setwd("/Users/dill/teaching/env_geog/2021-22/env_geog_code/week1/data")

# read in the data
d <- read.csv("onePlot.csv")

# print out the species so we know what to print
speciesList <- unique(d$species)

# make a histogram of each in turn
for( s in speciesList)
{
  hist(d$dbh[d$species==s])
}

# can tidy it up to display them all on one page

