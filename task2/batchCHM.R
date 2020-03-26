
#####################
# This script reads #
# DSMs and DTMs and #
# calculates a CHM  #
# S Hancock    2020 #
#####################


# load packages
library(rgdal)
library(sp)
library(raster)

# directories and tile lists
dsmDir="/geos/netdata/env_geog/week_11/task2/lidar/DSM"
dtmDir="/geos/netdata/env_geog/week_11/task2/lidar/DTM"
tileList=list("NH70.tif","NH80.tif","NH81.tif","NH91.tif","NN79.tif","NN89.tif")
dtmRoot="DTM"
dsmRoot="DSM"


# loop over tiles
for(root in tileList){
  dsmPart=paste(dsmRoot,root,sep="_")
  dtmPart=paste(dtmRoot,root,sep="_")
  dsmName=paste(dsmDir,dsmPart,sep="/")
  dtmName=paste(dtmDir,dtmPart,sep="/")
  print(dsmName)

  # read data
  dsm <- raster(dsmName)
  dtm <- raster(dtmName)

  # calculate CHM
  chm=dsm-dtm

  # coarsen the resolution to get MCH
  endRes=10  # 10 m resolutio
  coarseFact=round(endRes/res(chm)[1])
  coarseCHM <- aggregate(chm, fact=coarseFact)


  # append to overall data
  if(exists('merged'))fList=list(merged,coarseCHM)
  else                fList=list(coarseCHM) # if this is the first time, it does not exist yet
  merged <- do.call(merge,fList)

} # tile loop


# write to a new geotiff
chmName="mergedCHM.tif"
writeRaster(merged,chmName, format="GTiff",datatype="INT1U", overwrite=TRUE)
print(chmName)

