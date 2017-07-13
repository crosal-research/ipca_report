import pylatex as pl
from pylatex.utils import bold
import pandas as pd
import numpy as np


# help function
def _fill_row(ind, df):
    '''
    return a list where, in the first, cell
    goes ind (particular index of df) and
    in the remaider goes the values of that row
    inputs:
    -----
    ind: str
    - df: DataFrame
    - returns:
    -------
    -list
    '''
    row = [ind]
    row.extend(df.loc[ind, :].values)
    return row


def gen_table(df, doc):
    '''
    add a table to a doc.
    inputs:
    ------
    - df: DataFrame
    - doc: str (latex document)
    returns:
    - side effect
    '''
    color = 'white'
    with doc.create(pl.Tabular('l | c | c | c', col_space='0.2cm', pos=['b'])) as table:
        header_row = ['Item'] + list(df.columns)
        table.add_hline()
        table.add_row(header_row, mapper=[bold])
        table.add_hline()
        table.add_hline()
    for ind in df.index:
        color = 'white' if color == 'lightgray' else 'lightgray'
        row = _fill_row(ind, df)
        if ind in ['Core Inflation (avg.)', "Foods at Home",
                   "Free Prices", "Monitored Prices", "Diffusion"]:
            table.add_row(row, mapper=[bold])
        else:
            table.add_row(row)

    table.add_hline()


def gen_doc(file_output):
    '''
    function to return a latex document with a table for Brazilian bonds
    input:
    -----
    - file_output: str
    returnt:
    str - latex output.
    '''
    doc = pl.Document('./latex/{}'.format(file_output), font_size='normalsize',
                      documentclass='standalone',
                      document_options=['article', 'crop=false'])
    return doc


# main
if __name__ == '__main__':
    # monitor average
    dfinal = pd.read_excel('./data/data.xlsx', sheetname='data_source',
                           parse_cols=[0, 1, 2, 3], index_col=[0])

    # send to publising
    doc = gen_doc('results')
    gen_table(dfinal, doc)
    doc.generate_tex()

#    print("table of results done!")
