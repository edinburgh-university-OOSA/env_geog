


######################
# This script read a #
# list of text files #
# and calculates the #
# correlation        #
# S Hancock     2020 #
######################


# make a list of filenames
dirName="/geos/netdata/env_geog/week_11/task1/correl"
fileList<-list("correlIllus.0.1.txt","correlIllus.10.txt","correlIllus.0.2.txt","correlIllus.1.txt","correlIllus.0.5.txt","correlIllus.3.txt","correlIllus.100.txt","correlIllus.6.txt")


# loop over the filename list
for(root in fileList){
  filename=paste(dirName,root,sep="/")
  # read the data, a space delimited text file, in to RAM
  dataset <- read.table(filename)

  # calculate the correlation
  correl=cor(dataset$V1,dataset$V2,method ="pearson")

  # plot a graph
  outName=paste(root,'correl',correl,'png',sep=".")
  png(outName)
  plot(dataset$V1,dataset$V2,xlab="Biomass (Mg/ha)", ylab = "Predictor", cex=1, pch=19, col="blue") ## need to add colour
  dev.off()
  print(outName)
}# filename loop

