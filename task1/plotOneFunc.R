

#######################
# This script read a  # 
# text file and plots #
# in order to help    #
# choose a function   #
# S Hancock     2020  #
#######################


# select a filename
filename="/geos/netdata/env_geog/week_11/task1/func_form/funcForm.line.txt"

# read the data, a space delimited text file, in to RAM
dataset <- read.table(filename)

# check the summary
summary(dataset)

# plot a graph
plot(dataset$V1,dataset$V2,xlab="Biomass (Mg/ha)", ylab = "Predictor", cex=1, pch=19, col="blue") ## need to add colour

# save that graph to a .png file to be used in a report
png('funcForm.line.png')
dev.off()

