

# Script to fit a line to data

# read data
filename <- '/geos/netdata/env_geog/week10/function/dataset.1.csv'
d <- read.csv(filename)

# fit the data
vars <- lm(d$AGBD ~ d$CHM)
print(vars)
c <- vars$coefficients[1]
m <- vars$coefficients[2]


# plot it
plot(d$CHM,d$AGBD,xlab="CHM (m)",ylab="AGBD (Mg/ha)")
abline(vars)

