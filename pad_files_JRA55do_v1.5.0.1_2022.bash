#!/bin/bash

VARS="friver huss licalvf prra prsn psl rlds rsds siconca siconc tas tos ts uas vas"
YEARS="2022"
INPUTDIRS="../original"

for year in $YEARS ; do

  for var in $VARS ; do

    nfiles=$( ls ../original | grep $year | grep ${var}_ | wc -l )
    if [ "$nfiles" != 1 ] ; then echo "cannot find a single file for $var for year $year" ; exit 1 ; fi
    infile=$( ls ../original | grep $year | grep ${var}_ )

    fileout=$( echo $infile | sed -e "s/\.nc/\.padded\.nc/" )
    if [ ! -f $fileout ] ; then
      ./pad_forcing/padding.py -d $INPUTDIRS -v $var -x 20220101 -v $var $infile
    fi

  done

done
