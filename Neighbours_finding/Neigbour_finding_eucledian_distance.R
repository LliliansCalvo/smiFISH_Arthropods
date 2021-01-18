library('reshape2')
library('tidyverse')
library(dplyr) 
library(tidyr) 
library(data.table) 


# First you need to make sure your working directory is the same as where the raw data is. 
# For that you will go to the the folder where your computer downloaded the git and 
# Use the comand bellow to establish that folder as your working directory in R

setwd("~/Downloads/smiFISH_Arthropods-main/Neighbours_finding/Raw_data") #Example of where the folder was downloaded in a mac
print(getwd())

# Using spectrin cells were segmented in Imaris and each cell is given 
# a position in X,Y,Z that is their center point
# Import the cell middle position onto R 

df <- read.csv("Figure5_Cells_XYZ_Positions.csv")
rownames(df) <- df[,1]
df=df[,-1]

#Get a few lines from the dataframe
head(df)

#calculate euclidian distance
df1 = dist(df)
class(df1)

head(df1)

#Convert the distance matrix to a dataframe and melt so that you will get one-to-one distance
# comparaison of each cell to all the other cells in the embryo
df1_dist_m <- melt(as.matrix(df1), varnames = c("ID", "neig"))

# This has produced a very big dataframe with lots of unnecesarry data 
dim(df1_dist_m)

# Filter for distance smaller than a radius of 8 
# This chiffre can be adjusted to any specific value that the user wants
# You could use a small radius for direct neighbours, or a bigger one if 
# you are rather interested in larger zones

df2 <- df1_dist_m %>% subset(value < 8)
head(df2)


#subset df2 to produce a dataframe with only each cell and its neighbours
df3 = df2[,c(1,2)]
head(df3)

dim(df3) 


#Remove self interactions (when ID and neigh are the same)
df4 <-  subset(df3, ID != neig)
dim(df4) 


#Expand so you have for each cell ID the ID of all its neighbours next to it
results <-  df4 %>%  mutate(rm=rowid(ID)) %>%  pivot_wider(names_from = rm, values_from = neig) 

head(results)

#Write results in a csv file that can be visualized outside R
write.csv(results, "2020.11.16_results_eucledian_distance_center_points.csv")
