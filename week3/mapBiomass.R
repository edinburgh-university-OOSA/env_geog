
# script to apply biomass model to make map


# load libraries needed
library(raster)

# read CHM
chmName <- '/geos/netdata/env_geog/week10/lidar/mergedCHM.tif'
chm <- raster(chmName)

# apply model
biomass <- chm*2.837 + 128.983

# write data to geotiff
writeRaster(biomass,'biomass.tif', format="GTiff",datatype="INT1U", overwrite=TRUE)

