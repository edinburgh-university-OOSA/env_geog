
############################
# Script to process ground #
# data to biomass density  #
############################

# ground data file
filename='/geos/netdata/env_geog/week8/ground/groundData.csv'

# plot area in ha
area=20*20/(100*100)

# read in the data
d <- read.csv(filename)

# find number of unique plots
plots <- unique(d$plot)

# load allometric parameters from Muukkonen into a dataframe
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

# set up a dataframe to hold total biomass density. All 0 for now.
biomass <- as.data.frame(matrix(0,ncol=2,nrow=length(plots)))
colnames(biomass) <- c("plot","biomassDensity")


# loop over plots and fill in the biomass values per plot
j=1  # "j" here keeps count

for( p in plots ){

  # find DBH and species for alive trees within this plot
  thisDBH=d$dbh[(d$plot==p)&(d$state=='alive')]
  thisSP=d$species[(d$plot==p)&(d$state=='alive')]

  # loop over the trees within this plot and add up biomass
  for ( i in 1:length(thisDBH)){

    # extract allometric parameters for this equation
    beta0=beta[1,thisSP[i]]
    beta1=beta[2,thisSP[i]]
    beta2=beta[3,thisSP[i]]

    # biomass in Mg (divide by 1000 to convert kg to Mg), using Muukkonen equation 3
    thisBiomass=exp(beta0+beta1*thisDBH[i]/(thisDBH[i]+beta2))/1000.0

    # record plot number and add up biomass for this plot
    biomass$plot[j]=p
    biomass$biomassDensity[j]=biomass$biomassDensity[j]+thisBiomass
  }

  # scale biomass by plot area to get biomass density
  biomass$biomassDensity[j]=biomass$biomassDensity[j]/area

  j=j+1   # this keeps count of where in the data frame we are
}

# write data to a csv file, ready to read in later
outname='fieldBiomass.csv'
write.csv(biomass,outname)
print(outname)

