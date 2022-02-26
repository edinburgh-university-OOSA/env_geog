# Achieve task 3 with repeated lines

# read in the data
d <- read.csv("onePlot.csv")

# print out the species so we know what to print
unique(d$species)

# make a histogram of each in turn
hist(d$dbh[d$species=='PA'])
hist(d$dbh[d$species=='QR'])
hist(d$dbh[d$species=='PS'])
hist(d$dbh[d$species=='FS'])

# can tidy it up to display them all on one page

