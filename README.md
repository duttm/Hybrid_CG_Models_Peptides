# Hybrid_CG_Models_Peptides

This code has been developed by Akash Banerjee in the Prof. Meenakshi Dutt laboratory at Rutgers University. 

**Project Duration**: September 2018 to June 2021

**Modeled Systems**:
1. A single coarse-grained (CG) V<sub>6</sub>K2 peptide in aqueous solution
2. Multiple CG V6K2 peptides in aqueous solution


**Approach**: Bottom-up coarse-graining - where all potentials are developed by using All Atom (AA) Molecular Dynamics simulations as reference. 

**General Method for CG model development**: The Iterative Boltzmann Inversion (IBI) and Force Matching (FM) methods are applied to resolve CG potentials. 

## Software packages used for implementation: 

1. GROMACS for Molecular Dynamics Simulations (AA and CG). [http://www.gromacs.org/]
2. VOTCA for CG model building and development of CG potentials. [https://www.votca.org/csg-manual/index.html]

## AA Models and Force Fields:

1. The Amber99SB force field is used to run all AA simulations. [https://ambermd.org/AmberModels.php]
2. The Amber LEaP tool is used to build the initial AA peptide configuration. [http://ambermd.org/tutorials/pengfei/index.htm]
3. The SPC/E water model is used to solvate peptide systems. 

## Instructions for simulating a single CG V6K2 peptide in aqueous solution: 

1. Go to VnKm_Peptides/Coarse_Grained_Simulations/1peptide and open simulation_bash.bash
2. You will need a GROAMCS executable to run this simulation. Please enter the path for the executable in the appropriate location (set value for the variable 'exp_grompp').
3. Run the script using: ./simulation_bash.bash
4. The bash file will run the simulation for 1ns (may take around 20 minutes on a Desktop computer). 
5. A file called as output-CG.gro would be dumped at the end of the simulation. You can visualize this file using VMD [https://www.ks.uiuc.edu/Research/vmd/] or any other visulation software of your choice.
6. To analyze the simulation trajectory, please run the simulation for an additional 100 ns. (This can be done by changing the number of MD steps in the grompp.mdp file)
7. Steps 1 to 6 can be repeated for the 8 peptide system. Go to VnKm_Peptides/Coarse_Grained_Simulations/8peptides to launch a new simulation. 

### Additional Notes 

1. For some versions of GROMACS, you may need to change certain features in the MDP file. 
2. You can hike the timestep after initial equilibration. 

### Compilation Notes: 

We have reproduced our results in following computational resources: 

1. Bridges2 super computer provided by XSEDE (8 cores on RM-shared queue) [https://www.psc.edu/resources/bridges-2/user-guide-2/]
2. Desktop computer (8 MPI threads)
3. GROMACS versions: 2016.6 and 2018.3 

Please note that for any other combination, you may need to change simulation parameters. (Specifically, in the MDP file)
