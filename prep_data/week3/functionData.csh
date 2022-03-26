#!/bin/csh -f

# Generate data for fucntion fitting exercise

set bin="$HOME/teaching/env_geog/2021-22/env_geog_code/prep_data/week2"


set output="dataset.1.png"
@ numb=20
set bias=0
set rmse=20

python3 $bin/makeData.py --writePoints --output $output --numb $numb --bias $bias --rmse $rmse --noGraph


