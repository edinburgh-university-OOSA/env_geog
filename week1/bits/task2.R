
# set working dorectory 
# you will need to modify it to point to your data
setwd("/Users/dill/teaching/env_geog/2021-22/env_geog_code/week1/data")

# read in the data
d <- read.csv("onePlot.csv")

# print out all unique species entries
unique(d$species)

# count the number of unique species
length(unique(d$species))

