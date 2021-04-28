#!/usr/bin/env python

import os
import glob
import sys

#get current working dir, set count, and select file delimiter
path = os.getcwd()
#os.chdir(path)


#parses through files and saves to a dict
names={}
pathName = path + '/**/*.dart'
for fn in glob.glob(pathname = pathName, recursive = True):
    with open(fn) as f:
        names[fn]=sum(1 for line in f if line.strip() and not line.startswith('#'))    


condition = 0
for k, v in names.items():
    if v > 1000:
        condition = 1
        print("{}: {}".format(k, v))

if condition != 0:
    sys.exit("Please keep the following file size below 300 lines of code")
