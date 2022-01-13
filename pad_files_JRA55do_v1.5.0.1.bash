#!/bin/bash

VARS="friver huss licalvf prra prsn psl rlds rsds siconca siconc tas tos ts uas vas"
YEARS=$( seq 2020 2021 )
INPUTDIRS="/archive/gold/datasets/reanalysis/JRA55-do/v1.5.0/original ../original"

for year in $YEARS ; do

  for var in $VARS ; do

    nfiles=$( ls ../original | grep $year | grep ${var}_ | wc -l )
    if [ "$nfiles" != 1 ] ; then echo "cannot find a single file for $var for year $year" ; exit 1 ; fi
    infile=$( ls ../original | grep $year | grep ${var}_ )

    fileout=$( echo $infile | sed -e "s/\.nc/\.padded\.nc/" )
    if [ ! -f $fileout ] ; then
      ./pad_forcing/padding.py -d $INPUTDIRS -v $var -x 202001010000-202007152100  $infile
    fi

  done

done
