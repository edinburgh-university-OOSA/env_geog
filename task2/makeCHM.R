

#####################
# This script reads #
# a DSM and DTM and #
# calculates a CHM  #
# S Hancock    2020 #
#####################



# load packages
library(rgdal)
library(sp)
library(raster)


# set DTM and DSM filanems
dsmName="/geos/netdata/env_geog/week_11/task2/lidar/DSM/DSM_NH70.tif"
dtmName="/geos/netdata/env_geog/week_11/task2/lidar/DTM/DTM_NH70.tif"

# read data
dsm <- raster(dsmName)
dtm <- raster(dtmName)

# calculate CHM
chm=dsm-dtm

# coarsen the resolution to get MCH
endRes=10  # 10 m resolutio
coarseFact=round(endRes/res(chm)[1])
coarseCHM <- aggregate(chm, fact=coarseFact)

# write to a new geotiff
chmName="CHM_NH70.tif"
writeRaster(coarseCHM,chmName, format="GTiff",datatype="INT1U", overwrite=TRUE)
print(chmName)


