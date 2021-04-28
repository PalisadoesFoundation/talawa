#!/usr/bin/env python3
import os
import sys

#get current working dir
path = os.getcwd()

#parses through files and saves to a dict
fileNamesWithSize={}

#libPath and testPath dir location
libPath = os.path.expanduser(os.path.join(path, 'lib'))
testPath = os.path.expanduser(os.path.join(path, 'test'))

#counting lines in lib dir
for root, dirs, files in os.walk(libPath, topdown=False):
    for name in files:
        fileLocation = os.path.join(root, name)
        with open(fileLocation) as f:
            fileNamesWithSize[fileLocation]=sum(1 for line in f if line.strip() and not line.startswith('#'))

#counting lines in test dir
for root, dirs, files in os.walk(testPath, topdown=False):
    for name in files:
        fileLocation = os.path.join(root, name)
        with open(fileLocation) as f:
            fileNamesWithSize[fileLocation]=sum(1 for line in f if line.strip() and not line.startswith('#'))   

#if the line rule is voilated then value is changed to 1 
isLineRuleVoilated = 0
fileCount = 0

for key, value in fileNamesWithSize.items():
    if value > 300:
        isLineRuleVoilated = 1
        fileCount += 1 
        print("{}: {}".format(key, value))

"""Error
If the number of coded lines is more than 300 in a File
Than the error message will be displayed

Empty lines are not counted as part of the file size
"""
if isLineRuleVoilated != 0:
    msg = "Above " + str(fileCount) + " files have more than 300 lines"
    print(msg)
    sys.exit(1)
else:
    sys.exit(0)
