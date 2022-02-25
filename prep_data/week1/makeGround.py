'''
Script to generate ground data
Produces field tree data for
use in week 1's exercise
'''


#########################################

import argparse
import numpy as np

#########################################

def readCommands():
  '''
  Get commandline arguments
  '''
  p = argparse.ArgumentParser(description=("An illustration of a command line parser"))
  p.add_argument("--output",dest="outName",type=str,default='test.csv',help=("Output filename\nDefault=test.csv"))
  p.add_argument("--nPlots", dest ="nPlots", type=int, default=1, help=("Number of plots\nDefault = 1"))
  p.add_argument("--meanMass", dest ="meanB", type=float, default=150, help=("Mean biomass in Mg/ha\nDefault = 150 Mg/ha"))
  cmdargs = p.parse_args()
  return cmdargs


#########################################

class plotData():
  '''Class to hold data for 1 plot'''

#########################################

class generateData():
  '''Class to hold generated plot data'''

  def __init__(self,nPlots,meanB):
    '''Class initialiser'''

  ###########################

    # make a species list
    self.makeSpecies()



    return


  ###########################

  def makeSpecies(self):
    '''Make a list of species'''
    self.nSp=5


#########################################

if __name__ == '__main__':
  '''Main block'''

  # read command line
  cmd=readCommands()

  # generate plot data
  data=generateData()

  # write data



#########################################

