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

if __name__=="__main__":
  def readCommands():
    '''
    Get commandline arguments
    '''
    p = argparse.ArgumentParser(description=("An illustration of a command line parser"))
    p.add_argument("--output",dest="outName",type=str,default='test.csv',help=("Output filename\nDefault=test.csv"))
    p.add_argument("--nPlots", dest ="nPlots", type=int, default=1, help=("Number of plots\nDefault = 1"))
    p.add_argument("--meanMass", dest ="meanB", type=float, default=150, help=("Mean biomass in Mg/ha\nDefault = 150 Mg/ha"))
    p.add_argument("--plotSize", dest ="pSize", type=float, default=20, help=("Plot side length in metres\nDefault = 20 m"))
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

    print("nTrees",self.nTrees,"biomass",biomass/(1000*20**2)*100**2)

    return


#########################################

class generateData():
  '''Class to hold generated plot data'''

  ###########################

  def __init__(self,biomasses):
    '''Class initialiser'''

    # make a species list
    self.makeSpecies()

    # allocate space
    self.nPlots=biomasses.shape[0]
    self.plots=np.empty((self.nPlots),plotData)

    # loop over plots and populate. Biomass is in kg/ha
    for i in range(0,self.nPlots):
      self.plots[i]=plotData(biomasses[i],self)

    return


  ###########################

  def makeSpecies(self,spList=["PA","PS","QR","FS"]):
    '''Make a list of species'''
    self.nSp=4

    # species list
    self.spList=spList

    # is conifer or not
    self.isConifer=np.empty((self.nSp),dtype=bool)
    self.isConifer[0]=True   # Picea abies. Norway spruce
    self.isConifer[1]=True   # Pinus sylvestrus. Scots pine
    self.isConifer[2]=False  # Quercus robur. English Oak
    self.isConifer[3]=False  # Fagus sylvatica. Beech

    # mean DBH, in cm
    self.meanDBH=np.empty((self.nSp),dtype=float)
    self.meanDBH[0]=15
    self.meanDBH[1]=25
    self.meanDBH[2]=30
    self.meanDBH[3]=18

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


  ###########################

  def writeCSV(self,outName):
    '''Write plot data to a csv'''

    # open
    f=open(outName,'w')
    line="plot,treeN,species,dbh,state\n"
    f.write(line)

    # loop over plots
    for i in range(0,self.nPlots):
      # loop over trees
      for j in range(0,self.plots[i].nTrees):
        line=str(i+1)+","+str(j)+","+str(self.plots[i].sp[j])+","+\
             str(self.plots[i].dbh[j])+","+str(self.plots[i].alive[j])+"\n" 
        f.write(line)

    f.close()
    print("Written to",outName)
    return


#########################################

if __name__ == '__main__':
  '''Main block'''

  # read command line
  cmd=readCommands()

  # set biomass values
  biomasses=np.random.uniform(low=0.0,high=350000*cmd.pSize**2/(100**2),size=cmd.nPlots)

  # generate plot data
  data=generateData(biomasses)

  # write data
  data.writeCSV(cmd.outName)


#########################################

