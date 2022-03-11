#!/bin/csh -f

# Make ground data for week 2
set bin="$HOME/teaching/env_geog/2021-22/env_geog_code/prep_data/week2"
set chm="/Users/dill/data/teaching/env_geog/week8/chm/mergedCHM.tif"

set output="groundData.csv"
set rmse=20
@ nPlots=20

python3 $bin/groundBiomass.py --nPlots $nPlots --chm $chm


