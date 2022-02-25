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

  def __init__(self,biomass):
    '''Class initialiser'''

    # loop over adding trees until full
    totB=0.0
    while(totB<biomass):

    return


#########################################

class generateData():
  '''Class to hold generated plot data'''

  ###########################

  def __init__(self,nPlots,meanB):
    '''Class initialiser'''

    # make a species list
    self.makeSpecies()

    # allocate space
    self.nPlots=nPlots
    self.plots=np.array((nPlots),plotData)

    # loop over plots and populate
    biomasses=np.random.uniform(low=0.0,high=250.0,size=nPlots)
    for i in range(0,nPlots):
      self.plots[i]=plotData(biomasses[i])

    return


  ###########################

  def makeSpecies(self):
    '''Make a list of species'''
    self.nSp=4

    self.spList=np.array((self.nSp),dtype=str)
    self.spList[0]="PA"  # Picea abies. Norway spruce
    self.spList[1]="PS"  # Pinus sylvestrus. Scots pine
    self.spList[2]="QR"  # Quercus robur. English Oak
    self.spList[3]="FS"  # Fagus sylvatica. Beech

    # is conifer or not
    self.isConifer=np.array((self.nSp),dtype=bool)
    self.isConifer[0]=True   # Picea abies. Norway spruce
    self.isConifer[1]=True   # Pinus sylvestrus. Scots pine
    self.isConifer[2]=False  # Quercus robur. English Oak
    self.isConifer[3]=False  # Fagus sylvatica. Beech

    # allometric parameters
    # Muukkonen, eg 2. b=B0.DBH**B1
    # Muukkonen, eg 3. b=exp(B0+B1*dbh/(dbh+B2))
    self.beta0=np.array((self.nSp),dtype=float)
    self.beta1=np.array((self.nSp),dtype=float)
    self.beta2=np.array((self.nSp),dtype=float)
    self.beta0[0]=-1.694   # Picea abies. Norway spruce
    self.beta1[0]=10.825
    self.beta2[0]=11.816
    self.beta0[1]=-2.688  # Pinus sylvestrus. Scots pine
    self.beta1[1]=10.745
    self.beta2[1]=8.062
    self.beta0[2]=-0.604  # Quercus robur. English Oak
    self.beta1[2]=10.677
    self.beta2[2]=15.9
    self.beta0[3]=-0.006  # Fagus sylvatica. Beech
    self.beta1[3]=10.933
    self.beta2[3]=21.216

    return


#########################################

if __name__ == '__main__':
  '''Main block'''

  # read command line
  cmd=readCommands()

  # generate plot data
  data=generateData()

  # write data



#########################################

