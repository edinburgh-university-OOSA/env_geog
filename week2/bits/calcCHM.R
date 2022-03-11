
library(rgdal)
library(sp)
library(raster)

dsmName <- '/geos/netdata/env_geog/week8/lidar/DSM/NS95NW_50CM_DSM_PHASE5.tif'
dtmName <- '/geos/netdata/env_geog/week8/lidar/DTM/NS95NW_50CM_DTM_PHASE5.tif'


# read data
dsm <- raster(dsmName)
dtm <- raster(dtmName)


# calculate chm
chm <- dsm-dtm


# make 20 m resolution
endRes=20  # 20 m resolutio
coarseFact=round(endRes/res(chm)[1])
coarseCHM <- aggregate(chm, fact=coarseFact)


# write to a new geotiff
chmName='NS95NW_50CM_CHM_PHASE5.tif'
writeRaster(coarseCHM,chmName, format="GTiff",datatype="INT1U", overwrite=TRUE)
print(chmName)

