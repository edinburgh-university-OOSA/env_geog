
# Script to read and plot data

# read data
filename <- 'G:/env_geog/week10/function/dataset.1.csv'
d <- read.csv(filename)

# print data
print(d)

# determine number of points
length(d$AGBD)

# plot the data
plot(d$CHM,d$AGBD,xlab="CHM (m)",ylab="AGBD (Mg/ha)")

