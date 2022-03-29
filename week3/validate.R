
# script to validate biomass estimate


# load libaries
library(rgdal)
library(sp)
library(raster)

# read data
estName <- 'biomass.tif'  # remote estimated biomas
estimated <- raster(estName)
groundName <- 'G:/env_geog/week10/ground/combinedValid.csv'
biomass <- read.csv(groundName)

# set input and output projections, using CRS codes
epsg <- make_EPSG()   # list of all epsg codes
crsIn <- epsg$prj4[epsg$code==4326]
crsOut <- epsg$prj4[epsg$code==27700]

# tell R which columns contain coordinates and projection
coordinates(biomass) <- c('lon','lat')
crs(biomass) <- crsIn

# extract remote estimated biomass values and add to dataframe
biomass$estAGBD <- extract(estimated, ground, method='simple')

# bias
bias <- mean(biomass$estAGBD-biomass$agbd)

# RMSE
rmse <- sqrt(mean((biomass$estAGBD-biomass$agbd)^2))

# correlatiom
cor(biomass$estAGBD,biomass$agbd)

