#!/usr/bin/env python
# Daniel S. Standage
# 3 Sept 2014
# Embed the table in the manuscript markup
import sys

table = open(sys.argv[1], "r").read()
text  = open(sys.argv[2], "r").read()

text = text.replace("::TABLEGOESHERE::", table)
print text
