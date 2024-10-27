#!bin/bash

Fruits=("dragon" "pie" "mango" "tamarind") #Array

echo "First fruit is: ${Fruits[0]}"
echo "Second fruit is: ${Fruits[1]}"
echo "Third fruit is: ${Fruits[2]}"
echo "Fourth fruit is: ${Fruits[3]}"

echo "First fruit is: ${Fruits[@]}"