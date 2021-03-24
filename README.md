--------------------
smiFISH_Arthropods
--------------------

Raw data and scripts for "smiFISH and embryo segmentation for single-cell multi-gene RNA quantification in arthropods" 
Llilians Calvo*, Matthew Ronshaugen, Tom Pettini*+. 2020

*Equal contributions\
+Correpsonding author


The R Scripts uploaded here as well as the supplemental files and the raw data allow to determine the neighbours of each cell in an embryo or tissue provided XYZ coordinates of each cell can be obtained from any segmentation software (ex. Imaris).\
If direct neighbours (touching cells) are desired the polygon method script should be used (/Neighbours_finding/Neigbour_finding_polygons.R). This code first draws each cell as a polygon using a segmented membrane. Secondly, the edges of polygons (cells) are slightly increased to detect all the cells that share an edge (directly touching/overlapping cells). This method works in both 2D and 3D.
However, if the user is more interested in nearby cells in a region (independently of them touching or not), the euclidian 
distance code should be used and the radius of search can be adjusted as desired (/Neighbours_finding/Neigbour_finding_eucledian_distance.R). This method works in 2D data (X,Y). 

We also provide two extra scripts:
- A script to substitute neighbours IDs by their mRNA content so that further stats/analysis can be performed with ease. 
- A script to reproduce the heatmaps showed in Figure 5.

All data required to run the scripts are localed in (/Neighbours_finding/Raw_data)\
doi.org/10.5281/zenodo.4447030


--------------------------
Purpose of this tutorial
--------------------------
The purpose of this tutorial and the provided test data is to allow even users with basic knowledge of R to be able to perform/reproduce these analysis in their entirety. The codes are fairly simple, fast and very light so that they can be run from any machine. Only R and the mentioned packages in the R scripts are required. However, if any problem is found please contact the authors of the publication: llilians.calvo@gmail.com and pettini.tom@gmail.com for any clarification or help. 

These R scripts are made available for anyone to use however a citation of the corresponding publication (Calvo, Pettini et al. 2021- https://doi.org/10.1038/s42003-021-01803-0) is required. 


--------------------
Folders description
--------------------
/Additional_files/ contains all the additional files used to generate the plots in the publication 

/Neighbours_finding/ contains the R scripts  to find the neighbours and convert neighbours into mRNA content using R

/Neighbours_finding/Raw_data/ contains the test data to run the tutorial 

/Neighbours_finding/Neighbours_results/ contains the output of the tutorial when run with the provided test data

/Heatmaps_embryo_code contains the R script for the whole embryo heatmaps 

/Supplementary_Data/ contains supplementary  Table 1 and Table 2. All smiFISH probes sequences and probes/fluorophores combinations

/Supplementary_Images contains high resolution images from Figures 1-3


