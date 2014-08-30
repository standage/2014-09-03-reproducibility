#!/usr/bin/env Rscript
# Daniel S. Standage
# 3 Sept 2014
# Plot the distances of each observation to a station.

args <- commandArgs(trailingOnly=TRUE)
control.file <- args[1]
treatment.file <- args[2]
output.file <- args[3]

control.data <- read.table(control.file, header=FALSE, col.names=c("Distance"))
treatment.data <- read.table(treatment.file, header=FALSE, col.names=c("Distance"))

control.hist <- hist(control.data$Distance, plot=FALSE)
treatment.hist <- hist(treatment.data$Distance, plot=FALSE)

png(output.file, height=1000, width=1000, res=150)
plot(control.hist$mids, control.hist$counts, col="blue", type="l", main="", xlab="Distance from closest station", ylab="Frequency")
lines(treatment.hist$mids, treatment.hist$counts, col="red")
d <- dev.off()

