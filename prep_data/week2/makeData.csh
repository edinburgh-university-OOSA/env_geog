#!/bin/csh -f

set bin="$HOME/teaching/env_geog/2021-22/env_geog_code/prep_data/week2"

set outRoot="lineExamp"
set rmseList="0 10 20 30 40 50 60 70 100"
set numb=55


foreach rmse( $rmseList )
  set output="$outRoot.rmse.$rmse.png"

  python3 $bin/makeData.py --numb $numb --rmse $rmse --output $output
end

