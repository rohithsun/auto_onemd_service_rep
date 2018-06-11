import pandas as pd

def read_csv_file(filename):
    with open(filename) as csvfile:
        dictionary_data = pd.read_csv(csvfile).to_dict(orient='records')
    return dictionary_data