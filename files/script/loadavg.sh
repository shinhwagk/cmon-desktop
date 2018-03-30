#!/bin/bash

line=$(sed -n "1p" /proc/loadavg)

get_row() {
  str=$1;
  col=$2;
  echo "$str" | awk "{print \$${col}}";
}

min1=$(get_row "$line" 1);
min5=$(get_row "$line" 2);
min15=$(get_row "$line" 3);

echo "[{\"min1\":${min1},\"min5\":${min5},\"min15\":${min15}}]";