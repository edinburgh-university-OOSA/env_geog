

'''
Script to make some sample
data and plots for week 2
'''


#########################################

import numpy as np
import argparse
import matplotlib.pyplot as plt


#########################################

def readCommands():
  '''
  Get commandline arguments
  '''
  p = argparse.ArgumentParser(description=("An illustration of a command line parser"))
  p.add_argument("--output",dest="outName",type=str,default='test.png',help=("Output filename\nDefault=test.png"))
  p.add_argument("--numb", dest ="numb", type=int, default=20, help=("Number of points\nDefault = 20"))
  p.add_argument("--minB", dest ="minB", type=float, default=0, help=("Min biomass in Mg/ha\nDefault = 0 Mg/ha"))
  p.add_argument("--maxB", dest ="maxB", type=float, default=250, help=("Max biomass in Mg/ha\nDefault = 250 Mg/ha"))
  p.add_argument("--bias", dest ="bias", type=float, default=0, help=("Bias in Mg/ha\nDefault = 0 Mg/ha"))
  p.add_argument("--rmse", dest ="rmse", type=float, default=0, help=("RMSE in Mg/ha\nDefault = 250 Mg/ha"))
  p.add_argument("--m", dest ="m", type=float, default=1/0.12, help=("Line gradient"))
  p.add_argument("--c", dest ="c", type=float, default=0, help=("Line y interept"))
  p.add_argument("--form", dest ="form", type=str, default="line", help=("Format of line. Line, exg or log"))
  cmdargs = p.parse_args()
  return cmdargs


class fakeData():
  '''Class to hold data to demonstrate correlation'''

  def __init__(self,numb,minB,maxB,m,c,bias,rmse,form="line"):
    '''Class initialiser'''

    self.n=numb

    # y is biomass
    y=np.random.uniform(low=minB,high=maxB,size=self.n)
    rmseArr=np.random.normal(loc=bias,scale=rmse,size=self.n)

    # x is MCH
    if(form=="line"):
      x=(y+rmseArr-c)/m

    # delete negative number
    self.x=x[(y>=0.0)&(x>=0.0)]
    self.y=y[(y>=0.0)&(x>=0.0)]

    return


  #############################

  def plotPoints(self,outName):
    '''Plot points'''

    plt.plot(self.x,self.y,'.')
    plt.ylabel("Biomass (Mg/ha)")
    plt.xlabel("Mean canopy height (m)")
    plt.savefig(outName)
    plt.close()
    print("Graph to",outName)

    return


#########################################

if __name__ == '__main__':
  '''Main block'''

  # read command line
  cmd=readCommands()

  # generate data
  d=fakeData(cmd.numb,cmd.minB,cmd.maxB,cmd.m,cmd.c,cmd.bias,cmd.rmse,form=cmd.form)

  # plot it
  d.plotPoints(cmd.outName)

#########################################

