


############################
# This script reads ground #
# data and makes a biomass #
# model                    #
# S Hancock    2020        #
############################


filename="/geos/netdata/env_geog/week_11/src/data/Height_Biomass_Alvie.csv"


# read the data
data <- read.csv(filename)

# plot it
plot(data$Total.biomass..Kg.m.2,data$Average.height..m,xlab="Biomass (kg/ha)",ylab="Mean height (m)",cex=1, pch=19, col="blue")

# fit a model
fits<-lm(data$Total.biomass..Kg.m.2 ~ data$Average.height..m)
cf <- round(coef(fits), 2)

# write results
print(paste("Line of best fit is m=",cf[2],"c=",cf[1],sep=" "))

