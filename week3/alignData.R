

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
crsIn <- epsg$prj4[epsg$code==4326]
crsOut <- epsg$prj4[epsg$code==27700]

# tell R which columns contain coordinates
coordinates(d) <- c('lon','lat')

# tell R which projection you are using
crs(d) <- crsIn

# reproject the data to EPSG:27700
dReproj <- spTransform(d, CRSobj=crsOut)


# read in CHM
chmName <- '/geos/netdata/env_geog/week10/lidar/mergedCHM.tif'
chm <- raster(chmName)

# extract CHM values and add to dataframe
plotCHM <- extract(chm, d, method='simple')
d$chm <- plotCHM

# write to csv
write.csv(d,'biomassCalData.csv')


