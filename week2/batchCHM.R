
library(rgdal)
library(sp)
library(raster)


dsmDir <- 'G:/env_geog/week8/lidar/DSM'
dtmDir <- 'G:/env_geog/week8/lidar/DTM'
chmDir <- 'M:/'

dsmList <- list.files(path=dsmDir,pattern='.tif') 

# loop over tiles
for(dsmRoot in dsmList){

  # set filenames
  dsmName <- paste(dsmDir,dsmRoot,sep="/")
  dtmName <- gsub('DSM','DTM',dsmName)

  # read data
  dsm <- raster(dsmName)
  dtm <- raster(dtmName)

  # calculate chm
  chm <- dsm-dtm

  # make 20 m resolution
  endRes <- 20  # 20 m resolutio
  coarseFact <- round(endRes/res(chm)[1])
  coarseCHM <- aggregate(chm, fact=coarseFact)

  # write to a new geotiff
  chmName <- gsub('DSM','CHM',gsub(dsmDir,chmDir,dsmName))   # new filename with directory and string changed
  writeRaster(coarseCHM,chmName, format="GTiff",datatype="INT1U", overwrite=TRUE)
  print(chmName)
}

