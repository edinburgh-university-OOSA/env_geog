

#####################
# This script reads #
# a DSM and DTM and #
# calculates a CHM  #
# S Hancock    2020 #
#####################



# load packages
library(rgdal)
library(raster)


# set DTM and DSM filanems
dsmName="/geos/netdata/env_geog/week_11/task2/lidar/DSM/DSM_NH70.tif"
dtmName="/geos/netdata/env_geog/week_11/task2/lidar/DTM/DTM_NH70.tif"

# read data
dsm <- raster(x = dsmName)
dtm <- raster(x = dtmName)


# calculate CHM

# write to a new geotiff

