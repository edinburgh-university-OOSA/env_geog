#!/bin/csh -f

# Make ground data for week 2
set bin="$HOME/src/env_geog/prep_data/week2"
set chm="/geos/netdata/env_geog/week8/lidar/chm/mergedCHM.tif"

set output="groundData.csv"
set rmse=20
@ nPlots=20

python3 $bin/groundBiomass.py --nPlots $nPlots --chm $chm --output $output 


