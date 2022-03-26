

# Script to reproject ground data


# packages needed
library(rgdal)


# read data
filename <- 'combinedBiomass.csv'
d <- read.csv(filename)


# set input and output projections, using CRS codes
epsg <- make_EPSG()   # list of all epsg codes
crsIn <- epsg$prj4[epsg$code==4326]
crsOut <- epsg$prj4[epsg$code==27700]


spTransform(leroy, CRSobj="+proj=moll +ellps=WGS84")


