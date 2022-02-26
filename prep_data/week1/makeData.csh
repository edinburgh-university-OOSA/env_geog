#!/bin/csh -f


# Script to generate field data for course

# first one plot's worth
set outName="onePlot.csv"
python3 makeGround.py --nPlots 1 --output $outName


# then 10 plots
set outName="allPlot.csv"
python3 makeGround.py --nPlots 10 --output $outName



