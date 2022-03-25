#!/bin/csh -f

set bin="$HOME/teaching/env_geog/2021-22/env_geog_code/prep_data/week2"


set outRoot="biasIllus"

set biasList="50 20 0 -20 -50"
set rmseList="0 10 20 50"


foreach rmse( $rmseList )
  foreach bias( $biasList )
    set output="$outRoot.bias.$bias.rmse.$rmse.png"

    python3 $bin/makeData.py --m 1 --c 0 --rmse $rmse --bias $bias --output $output --drawOneLine
  end
end

