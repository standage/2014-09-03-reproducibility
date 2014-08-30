#!/usr/bin/env Rscript
# Daniel S. Standage
# 3 Sep 2014
# Plot the locations of the data points

args <- commandArgs(trailingOnly=TRUE)
control.file <- args[1]
treatment.file <- args[2]
output.file <- args[3]

control.data <- read.table(control.file, header=FALSE, sep="\t", col.names=c("x", "y"))
treatment.data <- read.table(treatment.file, header=FALSE, sep="\t", col.names=c("x", "y"))
stations.x <- c(0, 1, 1, -1, -1)
stations.y <- c(0, 1, -1, 1, -1)

png(output.file, width=1000, height=1000, res=150)
plot(control.data$x, control.data$y, col="blue", pch=20, main="", xlab="South boundary", ylab="West boundary")
points(treatment.data$x, treatment.data$y, col="red", pch=20)
points(stations.x, stations.y, pch=13, cex=2.0)
d <- dev.off()
