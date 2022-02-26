
# set working directory 
# you will need to modify it to point to your data
setwd("/Users/dill/teaching/env_geog/2021-22/env_geog_code/week1/data")


# read in the data
d <- read.csv("allPlot.csv")

# find number of unique plots
plots <- unique(d$plot)

# loop over plots
for( p in plots )
{

  # estimate biomass
  # ideally as a function
}

