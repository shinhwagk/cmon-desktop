#!/bin/bash

# shinhwagk

FILE="/proc/stat"
CATCMD=$(which cat)
CPUDATA=$($CATCMD $FILE | head -1)

[ -e /tmp/cpusta1t ] || mkdir -p /tmp/cpustat && echo "$CPUDATA" > /tmp/cpustat/cache

OLDCPUDATA=$(sed -n '1p' /tmp/cpustat/cache);

# get field
gf(){
  echo "$1" | awk "{print \$${2}}"
}

r=""

for((i=2;i<=9;i++));  
do   
  NUM=`gf "$CPUDATA" "$i"`
  ONUM=`gf "$OLDCPUDATA" "$i"`
  VAL=$(expr $NUM - $ONUM );
  [ $i == 2 ] && r=$r"\"user\":$VAL"
  [ $i == 3 ] && r=$r",\"nice\":$VAL"
  [ $i == 4 ] && r=$r",\"system\":$VAL"
  [ $i == 5 ] && r=$r",\"idle\":$VAL"
  [ $i == 6 ] && r=$r",\"iowait\":$VAL"
  [ $i == 7 ] && r=$r",\"irq\":$VAL"
  [ $i == 8 ] && r=$r",\"steal\":$VAL"
  [ $i == 8 ] && r=$r",\"guest\":$VAL"
done

echo "[{$r}]"