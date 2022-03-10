
library(rgdal)
library(sp)
library(raster)

filename <- '/geos/netdata/env_geog/week8/lidar/DSM/DSM_NH80.tif'

# read data
dem <- raster(filename)

# print out the properties of the raster
dem

# view the map
plot(dem)

# view the projection information
dem@crs

# how to translate the above into an EPSG code?

