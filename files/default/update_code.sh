#!/bin/bash


case $1 in
  sim)
    cat index.php.sim > index.php
#    cat customer.php.sim.db > customer.php
#    cat vis.1.js > vis.js
  ;;
  vis)
    cat index.php.vis > index.php
#    cat customer.php.vis.db > customer.php
#    cat vis.1.js > vis.js
  ;;
  vis2)
    cat index.php.vis2 > index.php
#    cat customer.php.vis.db > customer.php
#    cat vis.2.js > vis.js
  ;;
  *)
    echo "Use vis or sim as an argument. exit"; exit 1
  ;;
esac

echo "Don't forget to increase the cookbook's version."
read -n1 -r -p "Press a key to continue" key

test -f metadata.rb && vi metadata.rb
test -f ../../metadata.rb && vi ../../metadata.rb

echo "Now commit the changes and push them back to github. Bye."

exit 0
