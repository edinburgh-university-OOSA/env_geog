#!/bin/csh -f

# Generate data for fucntion fitting exercise

set bin="$HOME/teaching/env_geog/2021-22/env_geog_code/prep_data/week2"


set output="dataset.1.png"
@ numb=21
set bias=0
set rmse=20

python3 $bin/makeData.py --writePoints --output $output --numb $numb --bias $bias --rmse $rmse --noGraph



set output="dataset.2.png"
@ numb=32
set bias=30
set rmse=75

python3 $bin/makeData.py --writePoints --output $output --numb $numb --bias $bias --rmse $rmse --noGraph


set output="dataset.3.png"
@ numb=7
set bias=0
set rmse=75

python3 $bin/makeData.py --writePoints --output $output --numb $numb --bias $bias --rmse $rmse --noGraph --minB 125 --maxB 135

