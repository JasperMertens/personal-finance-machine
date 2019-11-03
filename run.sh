#!/bin/sh

python3 bank-ingestion.py $1
sqlite3 -init init.sql test.db < query-balance.sql
#sqlite3 test.db < query-spending.sql
