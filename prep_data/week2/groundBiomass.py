

#############################################
# import packages

import sys
sys.path.append("/home/shancoc2/src/env_geog/prep_data/week1")
sys.path.append("/home/shancoc2/src/OOSA-code-public/week5/rasters")
from makeGround import *
from readTiff import tiffHandle


#############################################

if __name__ == "__main__":
  def readCommands():
    '''
    Get commandline arguments
    '''
    p = argparse.ArgumentParser(description=("An illustration of a command line parser"))
    p.add_argument("--output",dest="outName",type=str,default='test.csv',help=("Output filename\nDefault=test.csv"))
    p.add_argument("--nPlots", dest ="nPlots", type=int, default=1, help=("Number of plots\nDefault = 1"))
    p.add_argument("--chm",dest="chmName",type=str,help=("Input CHM filename"))
    cmdargs = p.parse_args()
    return cmdargs


#############################################

def setBiomass(chm,nPlots):
  '''set biomass from CHM'''

  # data pixels
  inds=np.where(chm.data<200)[0]

  # find bounds
  maxCHM=np.max(chm.data[inds])

  # pick random stratification



#############################################

if __name__ == "__main__":
  '''main block'''

  # read commands
  cmd=readCommands()

  # read geotiff
  chm=tiffHandle(cmd.chmName)

  # set biomass values
  biomasses=setBiomass(chm,cmd.nPlots)

  # set plot data data
  #data=generateData(biomasses)

  # write data
  #data.writeCSV(cmd.outName)

