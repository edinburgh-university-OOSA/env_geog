


#######################
# This script fits a  #
# line of best fit to #
# data in a list      #
# S Hancock      2020 #
#######################


# make a list of filenames
dirName="/geos/netdata/env_geog/week_11/task1/correl"
fileList<-list("correlIllus.0.1.txt","correlIllus.10.txt","correlIllus.0.2.txt","correlIllus.1.txt","correlIllus.0.5.txt","correlIllus.3.txt","correlIllus.100.txt","correlIllus.6.txt")


# loop over the filename list
for(root in fileList){
  filename=paste(dirName,root,sep="/")
  # read the data, a space delimited text file, in to RAM
  dataset <- read.table(filename)

  # use linear regression for a line of best fit
  fits<-lm(dataset$V1 ~ dataset$V2)  # note that is is y against x
  cf <- round(coef(fits), 2) 


  # plot a graph
  outName=paste("fit",root,'png',sep=".")
  png(outName)
  plot(dataset$V1,dataset$V2,xlab="Biomass (Mg/ha)", ylab = "Predictor", cex=1, pch=19, col="blue") ## need to add colour
  eq <- paste0("y =", ifelse(sign(cf[2])==1, " ", " - "),abs(cf[2]), " X ",ifelse(sign(cf[1])==1, " + ", " - "),cf[1])
  mtext(eq, 3, line=-2)
  abline(fits)
  dev.off()
  print(outName)
}# filename loop

