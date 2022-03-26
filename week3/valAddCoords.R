# script to add coordinates to ground biomass data

# filenames for biomass and coordinates
biomassFile <- 'G:/env_geog/week10/ground/validationBiomass.csv'
coordFile <- 'G:/env_geog/week10/ground/validationData.coords.csv'

# read both datasets
b <- read.csv(biomassFile)
c <- read.csv(coordFile)

# merge data
combined <- merge(b,c,by='plot')

# write to new csv file
outname <- 'combinedValid.csv'
write.csv(combined,outname)
print(outname)

