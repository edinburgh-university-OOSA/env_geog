

# Script to reproject ground data


# packages needed
library(rgdal)
library(sp)
library(raster)


# read data
filename <- 'combinedBiomass.csv'
d <- read.csv(filename)


# set input and output projections, using CRS codes
epsg <- make_EPSG()   # list of all epsg codes
crsIn <- epsg$prj4[epsg$code==4326][1]
crsOut <- epsg$prj4[epsg$code==27700][1]

# tell R which columns contain coordinates
xy <- d[,c(5,6)]

# make a spatial dataframe containing the projcetion information
spdf <- SpatialPointsDataFrame(coords=xy,data=d,proj4string=CRS(crsIn))

# read in CHM
chmName <- '/geos/netdata/env_geog/week10/lidar/mergedCHM.tif'
chm <- raster(chmName)

# extract CHM values and add to dataframe
plotCHM <- extract(chm, spdf, method='simple')
spdf$chm <- plotCHM

# write to csv
write.csv(spdf,'biomassCalData.csv')


