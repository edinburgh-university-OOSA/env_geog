


import sys
sys.path.append("/Users/dill/teaching/env_geog/2021-22/env_geog_code/prep_data/week1")

from makeGround import *



#############################################

if __name__ == "__main__":
  '''main block'''

  # read commands

  # read geotiff

  # set biomass values


  # set plot data data
  data=generateData(biomasses)

  # write data
  data.writeCSV(cmd.outName)

