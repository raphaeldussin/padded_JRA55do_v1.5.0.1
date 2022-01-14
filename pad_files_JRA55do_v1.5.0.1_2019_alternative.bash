#!/bin/bash

VARS="friver huss licalvf prra prsn psl rlds rsds siconca siconc tas tos ts uas vas"
YEAR=2019
INPUTDIR=/archive/gold/datasets/reanalysis/JRA55-do/v1.5.0/original
INPUTDIRS="/archive/gold/datasets/reanalysis/JRA55-do/v1.5.0/original ../original"

for year in $YEAR ; do

  for var in $VARS ; do

    nfiles=$( ls $INPUTDIR | grep $year | grep ${var}_ | wc -l )
    if [ "$nfiles" != 1 ] ; then echo "cannot find a single file for $var for year $year" ; exit 1 ; fi
    infile=$( ls $INPUTDIR | grep $year | grep ${var}_ )

    fileout=$( echo $infile | sed -e "s/\.nc/\.padded\.nc/" )
    if [ ! -f $fileout ] ; then
      ./pad_forcing/padding.py -d $INPUTDIRS -v $var -x 20200715 20200716 -v $var $infile
    fi

  done

done

for file in $( ls *.nc  | grep 2019 ) ; do echo $file ; fileout=$(echo $file | sed -e "s/1-5-0/1-5-0-1/g") ; mv $file $fileout ; done
