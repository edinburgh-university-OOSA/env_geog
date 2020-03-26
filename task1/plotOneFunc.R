

#######################
# This script read a  # 
# text file and plots #
# in order to help    #
# choose a function   #
# S Hancock     2020  #
#######################


# this is where we will read data from. NOTE that we will not have permission to write data here, 
# so will need to give the absolute path to the location we want to write ti

setwd("/geos/netdata/env_geog/week_11/task1/func_form")

# select a filename
filename="funcForm.line.txt"

# read the data in to RAM
dataset <- read.csv(filename)

# plot a graph


