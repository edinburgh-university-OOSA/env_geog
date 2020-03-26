


###########################
# This script read a list # 
# of text files and plots #
# in order to help choose #
# a function              #
# S Hancock          2020 #
###########################


# make a list of filenames
dirName="/geos/netdata/env_geog/week_11/task1/func_form"
fileList<-list("funcForm.asymp.txt","funcForm.exp.txt","funcForm.logtrans.txt","funcForm.nline.txt","funcForm.quad.txt","funcForm.cube.txt","funcForm.line.txt","funcForm.log.txt","funcForm.noise.txt")


# loop over the filename list
for(root in fileList){
  filename=paste(dirName,root,sep="/")
  # read the data, a space delimited text file, in to RAM
  dataset <- read.table(filename)

  # check the summary
  summary(dataset)

  # plot a graph
  outName=paste(root,'png',sep=".")
  png(outName)
  plot(dataset$V1,dataset$V2,xlab="Biomass (Mg/ha)", ylab = "Predictor", cex=1, pch=19, col="blue") ## need to add colour
  dev.off()
  print(outName)
}# filename loop

