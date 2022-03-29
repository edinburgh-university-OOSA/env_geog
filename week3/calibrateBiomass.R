

# Script to fit a line to data

# read data. Output of alignData.R
filename <- 'biomassCalData.csv'
d <- read.csv(filename)

# fit the data
vars <- lm(d$agbd ~ d$chm)
print(vars)
c <- vars$coefficients[1]
m <- vars$coefficients[2]


# plot it
plot(d$chm,d$agbd,xlab="CHM (m)",ylab="AGBD (Mg/ha)")
abline(vars)

