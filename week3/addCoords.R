
# script to add coordinates to ground biomass data

# filenames for biomass and coordinates
biomassFile <- '/geos/netdata/env_geog/week10/bits/fieldBiomass.csv'
coordFile <- '/geos/netdata/env_geog/week8/ground/groundData.coords.csv'

# read both datasets
b <- read.csv(biomassFile)
c <- read.csv(coordFile)

# merge data
combined <- merge(b,c,by='plot')

# write to new csv file
outname <- 'biomassCoords.csv'
write.csv(biomass,outname)
print(outname)

