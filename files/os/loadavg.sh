#!/bin/bash

line=$(sed -n "1p" /proc/loadavg)

function getColumn() {
  str=$1;
  col=$2;
  echo "$str" | awk "{print \$${col}}";
}


min1=`getColumn "$line" 1`
min5=`getColumn "$line" 2`
min15=`getColumn "$line" 3`

echo "[{\"min1\":${min1},\"min5\":${min5},\"min15\":${min15}}]"
