
# Script to calculate the correlation between two datasets

# read data
filename <- '/geos/netdata/env_geog/week10/function/dataset.1.csv'
d <- read.csv(filename)

# determine the correlation
cor(d$CHM,d$AGBD)



