'''
Script to generate ground data
Produces field tree data for
use in week 1's exercise
'''


#########################################

import argparse
import numpy as np
from math import exp

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

def muukonen3(dbh,beta0,beta1,beta2):
  '''Biomass allometric equation 3 from Muukonen et al'''

  biomass=exp(beta0+beta1*dbh/(dbh+beta2))

  return(biomass)

#########################################

class plotData():
  '''Class to hold data for 1 plot'''

  def __init__(self,biomass,dataStruct):
    '''Class initialiser'''

    # probality of alive
    probAlive=0.95

    # allocate arrays
    self.sp=[]
    self.dbh=np.array((),dtype=float)
    self.biomass=np.array((),dtype=float)
    self.alive=[]

    # loop over adding trees until full
    self.nTrees=0
    totB=0.0
    while(totB<biomass):
      # pick species
      spInd=np.random.randint(size=1,low=0,high=dataStruct.nSp)[0]

      # set properties
      self.dbh=np.append(self.dbh,np.random.poisson(lam=dataStruct.meanDBH[spInd]))
      self.sp.append(dataStruct.spList[spInd])
      self.biomass=np.append(self.biomass,muukonen3(self.dbh[self.nTrees],dataStruct.beta0[spInd],dataStruct.beta1[spInd],dataStruct.beta2[spInd]))
      if(np.random.random()<=probAlive):
        self.alive.append("alive")
      else:
        self.alive.append("dead")

      # add up living biomass
      if(self.alive[self.nTrees]=="alive"):
        totB+=self.biomass[self.nTrees]

      self.nTrees+=1

    print("nTrees",self.nTrees,"biomass",biomass/(1000*10**2)*100**2)

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
    self.plots=np.empty((nPlots),plotData)

    # loop over plots and populate. Biomass is in kg/ha
    biomasses=np.random.uniform(low=0.0,high=350000*10**2/(100**2),size=nPlots)
    for i in range(0,nPlots):
      self.plots[i]=plotData(biomasses[i],self)

    return


  ###########################

  def makeSpecies(self):
    '''Make a list of species'''
    self.nSp=4

    # species list
    #self.spList=np.empty((self.nSp),dtype=str)
    #self.spList[0]="PA"
    #self.spList[1]="PS"
    #self.spList[2]="QR"
    #self.spList[3]="FS"
    self.spList=["PA","PS","QR","FS"]

    # is conifer or not
    self.isConifer=np.empty((self.nSp),dtype=bool)
    self.isConifer[0]=True   # Picea abies. Norway spruce
    self.isConifer[1]=True   # Pinus sylvestrus. Scots pine
    self.isConifer[2]=False  # Quercus robur. English Oak
    self.isConifer[3]=False  # Fagus sylvatica. Beech

    # mean DBH, in cm
    self.meanDBH=np.empty((self.nSp),dtype=float)
    self.meanDBH[0]=10
    self.meanDBH[1]=20
    self.meanDBH[2]=25
    self.meanDBH[3]=12

    # allometric parameters
    # Muukkonen, eg 2. b=B0.DBH**B1
    # Muukkonen, eg 3. b=exp(B0+B1*dbh/(dbh+B2))
    self.beta0=np.empty((self.nSp),dtype=float)
    self.beta1=np.empty((self.nSp),dtype=float)
    self.beta2=np.empty((self.nSp),dtype=float)
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
  data=generateData(cmd.nPlots,cmd.meanB)

  # write data



#########################################

