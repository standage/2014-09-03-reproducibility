#!/usr/bin/env python
# Daniel S. Standage
# 3 Sept 2014
# Create a table summarizing the data
import numpy, sys

control = []
for line in open(sys.argv[1], "r"):
  dist = float(line.rstrip())
  control.append(dist)
c_n = len(control)
c_mu = numpy.mean(control)
c_sigma = numpy.std(control)

treatment = []
for line in open(sys.argv[2], "r"):
  dist = float(line.rstrip())
  treatment.append(dist)
t_n = len(treatment)
t_mu = numpy.mean(treatment)
t_sigma = numpy.std(treatment)

print "|  Sample   |  # Observations  |  Mean distance  | Std. dev. distance  |"
print "| --------- | ---------------- | --------------- | ------------------- |"
print "|  Control  |      %3d         |    %.4f       |       %.4f        |" % (c_n, c_mu, c_sigma)
print "| Treatment |      %3d         |    %.4f       |       %.4f        |" % (t_n, t_mu, t_sigma)


