--------------------
smiFISH_Arthropods
--------------------

Raw data and scripts for "smiFISH and embryo segmentation for single-cell multi-gene RNA quantification in arthropods" 
Llilians Calvo*, Matthew Ronshaugen, Tom Pettini*+. 2020

The tutorial described here will allow to determine the neighbours of each cell in an embryo or tissue when XYZ coordinates 
of each cell are provided. If direct neighbours (touching cells) are desired the polygon method tutorial should be used. 
This code first draws each cell as a polygon using membrane markers. Secondly, the edges of polygons can be slightly increased 
to detect all the cells that share an edge (directly touching/overlapping cells). 
However, if the user is more interested in nearby cells in a region (independently of them touching or not), the euclidian 
distance code should be used and the radius of search can be adjusted as desired. Both method would also work with only 2D data. 

We also provide an extra tutorial that allows the user to substitute neighbours by the mRNA content of each cell so that further 
stats/analysis can be performed with ease. 

* Equal contributions
+ Correpsonding author
--------------------------
Purpose of this tutorial
--------------------------
The purpose of this tutorial and the provided test data is to allow even user with basic knowledge of R to be able to perform these 
analysis in their entirety. The codes are fairly simple, fast and very light so that they can be run from any machine. Only R and
the mentioned packages in the tutoral are required. However, if any problem is found please contact the author
llilians.calvo@gmail.com or the correponding author pettini.tom@gmail.com for any clarification or help. 

These tutorial/code are made available for anyone to use however acknowledgement to the author Llilians Calvo and citation of the 
corresponding publication (Calvo, Pettini et al. 2020) is required. 


--------------------
Folders description
--------------------
/Neighbours_finding/ contains the Tutorial to find the neighbours and convert neighbours into mRNA content using R

/Neighbours_finding/Raw_data/ contains the test data to run the tutorial 

/Neighbours_finding/Neighbours_results/ contains the output of the tutorial when run with the provided test data


