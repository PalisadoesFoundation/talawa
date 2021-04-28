
import pytest
import pandas as pd
from io import StringIO
import os

test_output_path = os.path.dirname(os.path.abspath(__file__)) + \
                '/../../'

@pytest.mark.dataQC
def test_dataQC():
    assert os.path.exists(os.path.join(test_output_path, 'Q-Y5F6_1M.se.sorted.deduped.tin.xls'))
    assert countLines(os.path.join(test_output_path, 'Q-Y5F6_1M.se.sorted.deduped.tin.xls'))

def countLines(fileName):
    data = False
    file = open(fileName, "r")
    file.readline()
    if file.readlines()[6] != "geneID":
        data = True

    return data
