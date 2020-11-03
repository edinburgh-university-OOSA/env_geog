


#####################
# This script reads #
# CHM and estimates #
# biomass            #
# S Hancock    2020 #
#####################


# load packages
library(rgdal)
library(sp)
library(raster)

# directories and tile lists
chmName="/geos/netdata/env_geog/week_11/task2/lidar/CHM/mergedCHM.tif"


# read data
chm <- raster(chmName)


# best fit variables
c=2538.81
m=491.26

# apply model and rescale to Mg/ha
biomassMap=(chm*m+c)

# write biomass to a new geotiff
outName="biomassMap.tif"
writeRaster(biomassMap,outName, format="GTiff",datatype="FLT45", overwrite=TRUE)
print(outName)


