#!/bin/csh -f

# Generate data for fucntion fitting exercise

set bin="$HOME/teaching/env_geog/2021-22/env_geog_code/prep_data/week2"


set output="dataset.4.png"
@ numb=24
set bias=0
set rmse=37
set m=0.015
set c=25

python3 $bin/makeData.py --writePoints --output $output --numb $numb --bias $bias --rmse $rmse --form exp --m $m --c $c --maxB 330


