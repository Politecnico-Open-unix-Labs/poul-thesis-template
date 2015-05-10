#!/bin/bash

# TODO replace this ugly script with a Makefile

cd italiano
make clean
make
cd ..

cd english
make clean
make
cd ..

rm -rf output
mkdir output
mv english/output output/english
mv italiano/output output/italiano

mv output/english/single-sided/thesis.pdf output/english/single-sided-thesis.pdf
mv output/english/double-sided/thesis.pdf output/english/double-sided-thesis.pdf

mv output/italiano/singola-facciata/tesi.pdf output/italiano/tesi-singola-facciata.pdf
mv output/italiano/doppia-facciata/tesi.pdf output/italiano/tesi-doppia-facciata.pdf
