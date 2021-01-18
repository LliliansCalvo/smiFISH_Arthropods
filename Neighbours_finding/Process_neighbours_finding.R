# Once neighbours have been identified by following any of the previously used tutorial 
# (neighbours finding polygons or neighbours finding eucledian distance)
# this tutorial could be followed to replace the neighbours cells 
# by their mRNA content for statistic purpose. 


library('reshape2')
library('tidyverse')
library(dplyr) 
library(tidyr) 
library(data.table) 

# Use the comand bellow to establish the main folder of neighbour finding as your working directory
setwd(dirname(rstudioapi::getActiveDocumentContext()$path)) #Automatically set working directory

print(getwd())

#Load the results table on R and change the values of the neighbours 
# by their corresponding mRNA content

#Two tables are required:
# 1.	Neighbours results
# 2.	Gene (Eg: giant) with cell ID and mRNA content

#########################################################################################################

#Load both datasets 
df <- read.csv("2020.11.16_results_polygons_80k_exp_0.6.csv")
gt <- read.csv("./Raw_data/Figure4_gt_Spots.csv")

# Get first few lines of each dataframe
head(df)
head(gt)


#Replace all the values in df by their correponding number in giant 
gt_df <- df %>%
mutate(across(everything(), ~  gt$gt.spots[match(., gt$Cell.ID)]))

# Add rownames (cell ID of centroid cell) and rename columns
rownames(gt_df) <- df$Cell_ID
colnames(gt_df) <- c("centroid", "n_1", "n_2", "n_3", "n_4", "n_5", "n_6", "n_7", "n_8")

head(gt_df)

# Now  save this dataframe so it can be further analysed in R or excel as desired. 
# Where the first column (empty) is the ID of your centroid cell 
# centroid is the mRNA content of your centroid cell 
# and n_1 to n_8 are the mRNA content of the neighbours cells. 

write.csv(gt_df, "2020.11.15_giant_neig_mRNAs.csv")

