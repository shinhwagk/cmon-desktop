#!/bin/bash

# Filesystem     1024-blocks      Used Available Capacity Mounted on

cnt=`df -P | sed '1d' | wc -l`;

function getColumn() {
  str=$1;
  col=$2;
  echo $str | awk "{print \$${col}}";
}

function splitt() {
  line="$1";
  col=`getColumn "$line" 1`;
  colr1="{\"Filesystem\":\"$col\","
  col=`getColumn "$line" 2`;
  colr2="\"blocks\":${col},"
  col=`getColumn "$line" 3`;
  colr3="\"Used\":$col,"
  col=`getColumn "$line" 4`;
  colr4="\"Available\":$col,"
  col=`getColumn "$line" 5`;
  colr5="\"Capacity\": ${col::-1},"
  col=`getColumn "$line" 6`;
  colr6="\"MountedOn\":\"$col\"}"
  echo ${colr1}${colr2}${colr3}${colr4}${colr5}${colr6}
}

result=""

for idx in `seq 1 $cnt`
do
  line=`df -P | sed '1d' | sed -n ${idx}p`
  lineresult=`splitt "$line"`;
  if [ $idx == ${cnt} ]; then
    result="${result}${lineresult}";
  else
    result="${result}${lineresult},"
  fi
  
done

echo "["${result}"]";
