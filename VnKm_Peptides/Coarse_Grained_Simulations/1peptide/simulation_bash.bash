#!/bin/bash

#We have run this simulation on the following GROMACS versions : GROMACS 5, 2016.6, 2018.3, 2018 and 2020.2
#The simulation has been tested on the following machines: 
#1. Bridges2 (8 cores on the RM-shared queue)
# link to Bridges2 userguide: https://www.psc.edu/resources/bridges-2/user-guide-2/
#2. Local desktop computer (runs on 8 threads) 


#Please note that the MDP file may need to be changed if :
#1. You are using a different version of GROMACS
#2. A different machine
#3. Any other possible configuration other than the one this simulation has been tested on.

exp_grompp=/usr/local/gromacs/bin/gmx # Please enter the gromacs executable here 

input=conf # Name of the input coordinate file, i.e. the CG coordinates Mapped onto the AA system; We have used the csg_map tool in VOTCA-CSG to generate this configuration. For more information, please check out the VOTCA-CSG manual https://www.votca.org/csg/index.html

GRO="${input}.gro"

tpr=table
minim=grompp # the default run time is set to 1 nanosecond in this file. The simulation needs to run for much longer periods in order to generate good quality data.   
TOP=topol_CG.top ## the topology file
NDX=index_CG.ndx ## the index file of all coordinates and energy groups in the system. 


DIR=$PWD

cp ./bonded_pots/table_*.xvg $DIR

cp ./nonbondedpots/table_*.xvg $DIR

$exp_grompp grompp -f "${minim}.mdp" -c $GRO -o $tpr -p  $TOP -n $NDX 


# Please note that different version of GROMACS interpret tabulated potentials in various formats.

## For newer versions of Gromacs (Gromacs 2016.1 and beyond), use the following: 


$exp_grompp mdrun  -deffnm $tpr -v -tableb table_b1222.xvg table_a101771.xvg  table_a208771.xvg  table_a44771.xvg  table_b2999.xvg table_a10771.xvg   table_a2771.xvg    table_a45771.xvg     table_b3999.xvg table_a141772.xvg  table_a31771.xvg   table_a5771.xvg      table_b4999.xvg table_a142772.xvg  table_a32771.xvg   table_a6771.xvg      table_b5999.xvg table_a151772.xvg  table_a33771.xvg   table_a8771.xvg      table_b6999.xvg table_a152772.xvg  table_a34771.xvg   table_a9771.xvg      table_b7999.xvg table_a1771.xvg    table_a35771.xvg   table_b10999.xvg  table_b8999.xvg table_a201771.xvg  table_a41771.xvg   table_b11999.xvg  table_b9999.xvg table_a202771.xvg  table_a42771.xvg   table_b12999.xvg   table_b8222.xvg table_a205772.xvg  table_a43771.xvg   table_b1999.xvg table_d1.xvg table_d2.xvg table_d3.xvg table_d4.xvg table_d5.xvg table_d6.xvg table_d7.xvg table_d8.xvg table_d9.xvg   table_a400777.xvg table_a401777.xvg table_a502777.xvg


## For older version of Gromacs (such as 5.1.2), you may need to use it in the following mannner: $exp_grompp mdrun  -deffnm $tpr -v 


rm table_*.xvg 

mv table.gro output-CG.gro

## Please see the final configuration, i.e. output-CG.gro using any tool like VMD or Pymol. For centering the peptide/peptides, you can use gmx trjconv. Please refer to the gromacs trjconv documentation for centering molecules: https://manual.gromacs.org/documentation/2020/onlinehelp/gmx-trjconv.html







