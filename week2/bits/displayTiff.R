
library(rgdal)
library(sp)
library(raster)

filename <- '/geos/netdata/env_geog/week8/lidar/DSM/NS95NW_50CM_DSM_PHASE5.tif'

# read data
dem <- raster(filename)

# print out the properties of the raster
dem

# view the map
plot(dem)

# view the projection information
dem@crs

