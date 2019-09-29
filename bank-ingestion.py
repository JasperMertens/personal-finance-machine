import pdb
import sys
import csv
import os

# This file reads in the given csv file with raw bank
# transaction data and outputs a formatted csv file.

# The input and output format for the fields.
input_fields = [
        "Rekening", "Boekdatum",
        "Valutadatum", "Referentie",
        "Beschrijving", "Bedrag",
        "Munt", "Verrichtingsdatum",
        "Rekening tegenpartij", "Naam tegenpartij",
        "Mededeling"]
output_fields = [
        "Referentie", "Verrichtingsdatum",
        "Bedrag", "Munt",
        "Naam tegenpartij", "Rekening tegenpartij",
        "Mededeling"]

raw_path = "./../Raw_data/2019/" + sys.argv[1] + "/"
format_path = "./../Formatted_data/2019/" + sys.argv[1] + "/"
raw_csv_file = raw_path + os.listdir(raw_path)[0]
formatted_csv_file = format_path + os.listdir(raw_path)[0]
CSV_SEP=","
with open(raw_csv_file, "rb") as in_f, \
    open(formatted_csv_file, "wb") as out_f:
    reader=csv.DictReader(in_f, fieldnames=input_fields,
        delimiter=CSV_SEP)
    # Create a writer that writes the data in the order of output_fields
    # other keys provided are ignored.
    writer=csv.DictWriter(out_f, fieldnames=output_fields,
        delimiter=CSV_SEP, extrasaction="ignore")
    next(reader, None) # Skip header line
    writer.writeheader()
    for row in reader:
        writer.writerow(row)
