#!bin/bash

Fruits=("dragon" "pie" "mango" "tamarind") #Array

echo "First Fruit is: ${Fruits[0]}"
echo "Second Fruit is: ${Fruits[1]}"
echo "Third Fruit is: ${Fruits[2]}"
echo "Fourth Fruit is: ${Fruits[3]}"

echo "First Fruit is: ${Fruits[@]}"