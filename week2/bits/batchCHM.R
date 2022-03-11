
library(rgdal)
library(sp)
library(raster)


dsmDir='/geos/netdata/env_geog/week8/lidar/DSM'
dtmDir='/geos/netdata/env_geog/week8/lidar/DTM'
dtmRoot="DTM"
dsmRoot="DSM"

dsmList=list.files(path=dsmDir,pattern='.tif') 


# loop over tiles
for(dsmRoot in dsmList){

  # set filenames
  dsmName=paste(dsmDir,dsmRoot,sep="/")
  dtmName=gsub('DSM','DTM',dsmName)
  print(dsmName)

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
  print('Written to',chmName)
}

