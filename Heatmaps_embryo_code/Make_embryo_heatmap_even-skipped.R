library(ggplot2)
library(scales)

# Code to generate whole embryo heatmap variability
# Only eve is used for this example but the code will be the same for all the other genes

# Use the comand bellow to establish the main folder of neighbour finding as your working directory
setwd(dirname(rstudioapi::getActiveDocumentContext()$path)) #Automatically set working directory
setwd('..') # Automatically go one level up current working directory
print(getwd())

# Load the variability data for even-skipped
eve <- read.csv("./Neighbours_finding/Raw_data/Figure5_Variability_Calculations_eve.csv")

x = eve[,2]
y = eve[,3]

colors <- c("grey28","#FFFFCC", "#FFEDA0", "#FED976", "#FEB24C", "#FD8D3C" ,"#FC4E2A" ,"#E31A1C" ,"#BD0026", "#800026")

# plot heatmap for the calculated FANO FACTOR
eve_fano = eve[,5]
eve_ff = ggplot(eve, aes(x=x, y=y)) + geom_point(aes(colour=Fano.factor, size=Fano.factor)) + scale_size_continuous(range = c(1,6))  + scale_colour_gradientn(colours  = colors, breaks  = c(0,5,10,15,20),  limits=c(0.1,20), oob=squish)  + theme_bw() +  theme(axis.line = element_line(colour = "white"),  panel.grid.major = element_blank(),panel.grid.minor = element_blank(),panel.background = element_blank()) + xlab("cell position X ") +  ylab("cell position Y")
eve_ff + theme(plot.background = element_rect(fill = "black"),legend.background = element_rect(fill="black"), legend.key = element_rect(color = "white",  fill = "black"), legend.text = element_text( color = "white"))

#Get maximun value for the Fano Factor
max(eve$Fano.factor)


# Plot the proportional variability previously calculated

eve_prop_var= eve$PV

eve_PV = ggplot(eve, aes(x=x, y=y)) + geom_point(aes(colour=eve_prop_var, size=eve_prop_var)) + scale_size_continuous(range = c(1,6))  + scale_colour_gradientn(colours  = colors, breaks  =  c(0,0.3,0.6,0.9,1),  limits=c(0.01,0.6), oob=squish)  + theme_bw() +  theme(axis.line = element_line(colour = "white"),  panel.grid.major = element_blank(),panel.grid.minor = element_blank(),panel.background = element_blank()) + xlab("cell position X ") +  ylab("cell position Y")

eve_PV + theme(plot.background = element_rect(fill = "black"),legend.background = element_rect(fill="black"), legend.key = element_rect(color = "white",  fill = "black"), legend.text = element_text( color = "white"))

#Get the maximun value of the proportional variability
max(eve$PV)

#  Plot the numerical variability previously calculated

eve_n_var= eve$NV

eve_NV = ggplot(eve, aes(x=x, y=y)) + geom_point(aes(colour=eve_n_var, size=eve_n_var)) + scale_size_continuous(range = c(1,6))  + scale_colour_gradientn(colours  = colors, breaks  = c(0,0.1,0.2,0.3),  limits=c(0.001,0.25), oob=squish)  + theme_bw() +  theme(axis.line = element_line(colour = "white"),  panel.grid.major = element_blank(),panel.grid.minor = element_blank(),panel.background = element_blank()) + xlab("cell position X ") +  ylab("cell position Y")

eve_NV + theme(plot.background = element_rect(fill = "black"),legend.background = element_rect(fill="black"), legend.key = element_rect(color = "white",  fill = "black"), legend.text = element_text( color = "white"))

#Get the maximun value of the numerical variability
max(eve$NV)

