install.packages("tidyverse")
install.packages("MASS")
install.packages('nortest')
install.packages("fitdistrplus")

library(xlsx)
library(tidyverse)
library(stats)
library(MASS)
library(fitdistrplus)
library(nortest)
library(actuar)

#set working directory
setwd("/Users/macbook/Library/CloudStorage/GoogleDrive-sachinik.maths@stu.cmb.ac.lk/.shortcut-targets-by-id/1edOijJGKKM2qUoai23I5rj_Ei2jUV9ww/Drought Analysis /1. MSDI Index/4. Codes and Simulations/Revision2Codes")

#reading excel file
readExcel=read.xlsx("NC.xlsx", sheetIndex = 1, header = TRUE)
readExcel

#extracting rainfall data set
R=df$Rainfall
R

####################################################
#converting rainfall data into 0-1 range
RS=(R-min(R))/(max(R)-min(R))

####################################################
# Estimate the parameters using the method of moments -MANUALLY
mean_R_scale <- mean(RS)
var_R_scale <- var(RS)
alpha <- (((mean_R_scale*(1-mean_R_scale))/var_R_scale)-1)*mean_R_scale
beta <- (((mean_R_scale*(1-mean_R_scale))/var_R_scale)-1)*(1-mean_R_scale)
alpha=0.56
beta=2.56
######################

#Plotting

#Compute the PDF
pdf_beta <- function(x, a, b) {
  ifelse(x < min(x) | x > max(x), 0, ((x - min(x))^(a-1) * (max(x) - x)^(b-1)/((max(x)-min(x))^(a+b-1))) / beta(a, b))
}

x <- seq(0, 1, length = 40)
par(mar = c(3, 3, 1, 1))
# Plot the histogram of the scaled data
hist(R, breaks = 15, freq = FALSE,xlab = 'Rainfall data',xlim=c(0,20),ylim=c(0,0.3),ylab='Probability Density')

# Add a beta PDF to the plot
curve(pdf_beta(x,alpha,beta), col = "red", lwd = 2, add = TRUE )

pb=pdf_beta (R,alpha,beta)
pb

#replacing large values
pb[pb==Inf] <- 10000000000
pb

# Calculate the log-likelihood of the fitted distribution
ll =sum(log(pb+1e-10))
ll

# Get number of parameters in model
k <- length(c(alpha, beta))

# Calculating AIC
AIC <- 2 * k - 2 * ll
AIC

####################################################

#Beta fit to rainfall data Using R using inbuilt functions -moment matching estimation

r_beta=fitdist(RS, "beta",method=c('mme'),start=NULL)
r_beta
#shape1 0.5654234
#shape2 2.5622352

