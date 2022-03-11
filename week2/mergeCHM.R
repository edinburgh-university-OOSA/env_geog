
# load packages
library(rgdal)
library(sp)
library(raster)

# make list of chm filenames
chmList=list.files(path='.',pattern='50CM_CHM_PHASE5.tif')

for( filename in chmList ){

  # open data
  chm <- raster(filename)

  # append to overall data
  if(exists('merged')){
    fList=list(merged,chm)
    merged<- do.call(merge,fList)
  }else merged=chm
} 

# write to a new geotiff
chmName="mergedCHM.tif"
writeRaster(merged,chmName, format="GTiff",datatype="INT1U", overwrite=TRUE)
print(chmName)

