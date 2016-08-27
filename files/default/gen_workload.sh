#!/bin/bash

positions=('Socks' 'Apples' 'Orange-Juice' 'Orange' 'Dirol' 'PlayStation4' 'T-shirts' 'iPhone5' 'iPhone6' 'iPhone7' 'iPhone8' 'Pizza' 'McBurgers' 'Pens' 'TV-addons' 'Egypt-travels' 'Tesla-Model-S' 'MacBook-Air' 'MercedezBenz-Q' 'Potato' 'Snickers' 'Intel-Xeon-Extreme-9909-CPU' 'Flowers' 'Balls' 'Backpacks' 'Wifi-routers')

choose_item() {
  count_items=${#positions[@]}
  item=$(shuf -i0-$count_items -n1)
  let item=item-1
  echo ${positions[$item]}
}

makeload_on() {
  dst_host=$1
  reqs=$(shuf -i1-5 -n1)
  for i in `seq 1 10`; do
      use_item=`choose_item`
      order='ordered'
      if [ $i -lt 2 ]; then
        order='cancelled' 
      fi
      url="$1?item=$use_item&status=$order"
      ab -c $reqs -n $reqs "$url" &
  done
}


makeload_on http://acceptance01.example.com/index.php
makeload_on http://union01.example.com/index.php
makeload_on http://rehearsal01.example.com/index.php
makeload_on http://delivered01.example.com/index.php

