


############################
# This script reads ground #
# data and makes a biomass #
# model                    #
# S Hancock    2020        #
############################


filename="/geos/netdata/env_geog/week_11/src/data/Height_Biomass_Alvie.csv"


# read the data
data <- read.csv(filename)


# split in to calibration and validation data
calData=data[c(1:6),]
valData=data[c(7:10),]

# fit a model
fits <- lm(calData$Total.biomass..Kg.m.2 ~ calData$Average.height..m)
cf <- round(coef(fits), 2)

# error statistics
biomass=cf[2]*valData$Average.height..m+cf[1]
error=biomass-valData$Total.biomass..Kg.m.2
bias=mean(error)
RMSE=sqrt(mean(error^2))
correl=cor(biomass,valData$Total.biomass..Kg.m.2)

# plot it
png("errorLine.png")
plot(calData$Total.biomass..Kg.m.2,calData$Average.height..m,xlab="Biomass (kg/ha)",ylab="Mean height (m)",cex=1, pch=19, col="blue")
points(valData$Total.biomass..Kg.m.2,valData$Average.height..m,cex=1, pch=19, col="red")
abline(fits)
dev.off()

# write results
print("Error Statistics")
print(paste("bias",bias,sep=" "))
print(paste("RMSE",RMSE,sep=" "))
print(paste("Correlation",correl,sep=" "))


