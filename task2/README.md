# Biomass mapping with lidar data

These R scripts take DTMs and DSMs from the [Scottish Government lidar data archive](https://remotesensingdata.gov.scot/data#/list) and estimate biomass from them.

The path names here are written to run on the University of Edinburgh's School of Geoscience's linux clusters.


### batchCHM.R

Loops over a list of lidar tiles, coarsens to 10 m resolution (as the native 1m resolution is too fine for the DSM to be accurate) and subtracts the DTMs from the DSMs to make CHMs. Note that the filenames and directories are hard-wired in to the code and would need adjusting for your area and computer.


### groundModel.R

Reads ground data, intersects with the CHM and fits a linear model to predict the ground measured biomas from the mean CHM. It returns the linear model parameters.


### applyModel.R

Applies the linear model returned by groundModel.R to the CHMs created by batchCHM.R to make a biomass map.


### modelError.R

Assess the accuracy of the CHM to biomas model. This is not a comprehensive error analysis, as that data was not available at the site this was developed for.


### makeCHM.R

This was a test script for batchCHM.R and does the same process for a single tile. It has been replaced by batchCHM.R and is not needed.

