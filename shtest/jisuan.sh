#!/bin/bash
RES=$(((1+2)*3))
echo $RES
RES2=$[(1+2)*3]
echo $RES2
TEMP=`expr 1 + 2`
RES3=`expr $TEMP \* 3`
echo $RES3
