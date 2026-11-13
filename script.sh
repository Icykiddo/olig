#!/usr/bin/env bash
mkdir -p data_analysis

cat faculty_3.csv | sed -E 's/^[^,]+,[^,]+,//' | tr '+' '\n' | sed -E 's/^[ \t]*//; s/[ \t]*$//' | grep -v '^$' | sort | uniq > data_analysis/research_themes

wc -l < data_analysis/research_themes >> data_analysis/research_themes

grep -v '+' faculty_3.csv | grep ', Professor,' > data_analysis/unique.txt

grep 'Computational Education' faculty_3.csv | grep 'Computer Systems' > data_analysis/joined.csv

grep -E '\+.*\+' faculty_3.csv | sed 's/,.*//' > data_analysis/names.txt

