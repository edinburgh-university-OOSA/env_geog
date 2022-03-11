
############################
# Script to process ground #
# data to biomass density  #
############################

# ground data file
#filename="/geos/netdata/env_geog/week8/ground/allPlot.csv"
filename='/Users/dill/teaching/env_geog/2021-22/env_geog_code/week1/data/allPlot.csv'

# plot area in ha
area=20*20/(100*100)

# read in the data
d <- read.csv(filename)

# find number of unique plots
plots <- unique(d$plot)

# set up allometric parameters as a dataframe
beta <- data.frame(matrix(ncol=4,nrow=3))
colnames(beta) <- c('FS','PA','PS','QR')
beta$FS[1]=0.006   # beta 0
beta$FS[2]=10.933  # beta 1
beta$FS[3]=21.216  # beta 2
beta$PA[1]=-1.694  # beta 0
beta$PA[2]=10.825  # beta 1
beta$PA[3]=11.816  # beta 2
beta$PS[1]=-2.688  # beta 0
beta$PS[2]=10.745  # beta 1
beta$PS[3]=8.062   # beta 2
beta$QR[1]=-0.604  # beta 0
beta$QR[2]=10.677  # beta 1
beta$QR[3]=15.900  # beta 2

# dataframe to hold total biomass density. All 0 for now with plot names as columns
biomass <- as.data.frame(matrix(0,ncol = length(plots), nrow = 1))
colnames(biomass) <- c(plots)


# loop over plots
for( p in plots )
{
  print(p)

  # find DBH and species for alive trees in this plot
  thisDBH=d$dbh[(d$plot==p)&(d$state=='alive')]
  thisSP=d$species[(d$plot==p)&(d$state=='alive')]

print('here?')
  # loop over trees and add up biomass
  for ( i in 1:length(thisDBH)){
print(i)

    # allometric parameters for this equation
    beta0=beta[1,thisSP[i]]
    beta1=beta[2,thisSP[i]]
    beta2=beta[3,thisSP[i]]
print(beta0)

    thisBiomass=exp(beta0+beta1*thisDBH[i]/(thisDBH[i]+beta2))
print(thisBiomass)
print(thisBiomass)
§

    # add up biomass for this plot
    biomass[p]=biomass[p]+thisBiomass
  }


  # scale biomass by plot area
  biomass[p]=biomass[p]/area
}

# write data to a csv file

