

# read in the data
d <- read.csv("allPlot.csv")

# print out all unique species entries
unique(d['species'])

# count the number of unique species
nrow(unique(d['species']))

