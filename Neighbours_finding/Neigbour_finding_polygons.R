library(magrittr)
library(dplyr)
library(tidyr)
library(data.table)
library(sf)


# Use the comand bellow to establish the main folder of neighbour finding as your working directory

setwd(dirname(rstudioapi::getActiveDocumentContext()$path)) #Automatically set working directory

print(getwd())

# this will print your working directory, the output should look like this:
# "~/SOMEWHERE_IN_YOUR_COMPUTER/smiFISH_Arthropods-main/Neighbours_finding"


# Import measurements from Imaris onto R, located in Raw_data
# The starting data frame of (x,y,z) positions of Spectrin spots was obtained from Imaris 
# by segmenting Spectrin antibody staining. Each cell is composed of several spots of spectrin signal around the membrane
df_80k <- read.csv('./Raw_data/Figure4_80K_Spectrin_Spots_XYZ_Positions.csv')

#Change column names
colnames(df_80k) <- c("Cell_ID", "Spot_ID", "X", "Y", "Z")


# Convert dataframe to an sf object. 
# By using dplyr package you will group all membrane spots corresponding to the same cell ID together, 
# and each spot will be join to make the shape of a cell (Polygon)
# This will work with 3D coordinates or 2D. 

df_80k_sf <- st_as_sf(df_80k,
                      coords = c('X', 'Y', 'Z')) %>%
    group_by(Cell_ID) %>%
    summarise() %>%
    ungroup() %>%  # Just in case
    st_convex_hull()

# Check class if desired 
class(df_80k_sf)

#The result should look like this: [1] "sf"         "tbl_df"     "tbl"        "data.frame"

#Plot the sf object, 
# polygons of all the cells in the embryo are plotted. 
# This will replicate the shape of the embryo and produce the same plot as in Figure 4C in the publication    
plot(df_80k_sf, col = sf.colors(categorical = TRUE, alpha = .5), main = "80K 0exp")

#Ignore colour warning message

#Expand all polygons of 0.6um, effectively you are making each cell be a bit bigger 
# therefore now cells will invade their neighbours creating an overlap that we will later exploit
# to find the neighbours

df_80k_0.6_sf <- st_as_sf(df_80k,
                   coords = c('X', 'Y', 'Z')) %>%
                  group_by(Cell_ID) %>%
                  summarise() %>%
                  ungroup() %>%  # Just in case
                  st_convex_hull() %>%
                  st_buffer(0.6)

#Plot the expanded cells polygons, same as plot in Figure 4C (expanded crop)
plot(df_80k_0.6_sf, col = sf.colors(categorical = TRUE, alpha = .5), main = "80K 0exp")

#Find intersection between the expanded cells (sf object), to highlight now touching cells
a_80k_0.6 = st_set_geometry(st_intersection(df_80k_0.6_sf,df_80k_0.6_sf), NULL)

#Remove self interactions (every time a cell gives herself as a neighbour we delete it) 
a2_80k_0.6 <- subset(a_80k_0.6, Cell_ID != Cell_ID.1)


#Reshape: expand wide the results so that each cell ID has its neighbours listed 
# next to it
results_80k_0.6 = a2_80k_0.6%>% 
    mutate(rn = rowid(Cell_ID)) %>%
    pivot_wider(names_from = rn, values_from = Cell_ID.1)

head(results_80k_0.6)

#Save results as a table that you could use in excel and visualize outside R
write.csv(results_80k_0.6, "2020.11.16_results_polygons_80k_exp_0.6.csv", na="", row.names=FALSE)
