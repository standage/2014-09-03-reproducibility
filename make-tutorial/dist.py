#!/usr/bin/env python
# Daniel S. Standage
# 3 Sept 2014
# Determine the distance between each data point and the closest station.
import sys

class Point:
  def __init__(self, x, y):
    self.x = x
    self.y = y

def distance(p1, p2):
  return ((p1.x - p2.x)**2 + (p2.y - p2.y)**2)**(0.5)

def min_distance(p):
  stations = [Point(0,0), Point(1,1), Point(1,-1), Point(-1,-1), Point(-1,1)]
  distances = []
  for s in stations:
    distances.append(distance(s, p))
  return min(distances)

if __name__ == "__main__":
  for line in sys.stdin:
    x, y = line.rstrip().split("\t")
    p = Point(float(x), float(y))
    d = min_distance(p)
    print "%.4f" % d
