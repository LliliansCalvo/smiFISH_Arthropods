# smiFISH_Arthropods
Raw data and scripts for "smiFISH and embryo segmentation for single-cell multi-gene RNA quantification in arthropods" Llilians Calvo*, Matthew Ronshaugen, Tom Pettini*.  2020


Neigbour finding tutorial can ce found in Neigbour finding tutorial

Neigbour finding tutorial
In order to calculate neigbours for each cell we used our mesurements from Imaris segmentation. We got X,Y,Z coordinates for each cell as well as for membranes spots. 
These mesurements were then imported into R and processed as detaled bellow. 

library("sf")
df_80k <- read.csv('Euclidean_80K_Spots.csv')
colnames(df_80k) <- c("Cell_ID", "Spot_ID", "X", "Y", "Z")
head(df_80k)
  Cell_ID   Spot_ID       X       Y         Z
1       0 600000000 193.722 175.733 0.0998975
2       0 600000001 192.895 176.727 0.0998975
3       0 600000002 193.828 177.462 0.0998975
4       8 600000003 178.173 178.220 0.0998975
5       7 600000004 187.065 178.285 0.0998975
6       0 600000005 190.754 178.186 0.0998975


df_80k_sf <- st_as_sf(df_80k,
                      coords = c('X', 'Y', 'Z')) %>%
    group_by(Cell_ID) %>%
    summarise() %>%
    ungroup() %>%  # Just in case
    st_convex_hull()

