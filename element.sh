#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table --tuples-only -c"

if [[ $1 ]]
then
    ELEMENT=$1
else
echo "Please provide an element as an argument."
exit
fi

if [[ $ELEMENT =~ [A-Za-z]{3,} ]]
then
  ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE name='$ELEMENT'")
elif [[ $ELEMENT =~ [A-Za-z]{1,2} ]]
then
  ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$ELEMENT'")
elif [[ $ELEMENT =~ [0-9]{1,} ]]
then
  ATOMIC_NUMBER=$ELEMENT
fi

# if not found
if [[ $ATOMIC_NUMBER = '' ]]
then
echo -e "I could not find that element in the database."
else
ATOMIC_NUMBER_FORMATTED=$(echo $ATOMIC_NUMBER | sed 's/[ ]*([0-9]+)/{}/g')
SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number='$ATOMIC_NUMBER'")
SYMBOL_FORMATTED=$(echo $SYMBOL | sed 's/[ ]*([A-Za-z]+)/{}/g')
NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number='$ATOMIC_NUMBER'")
NAME_FORMATTED=$(echo $NAME | sed 's/[ ]*([A-Za-z]+)/{}/g')
TYPE=$($PSQL "SELECT type FROM elements INNER JOIN properties ON elements.atomic_number=properties.atomic_number INNER JOIN types ON properties.type_id=types.type_id WHERE elements.atomic_number='$ATOMIC_NUMBER'")
TYPE_FORMATTED=$(echo $TYPE | sed 's/[ ]*([A-Za-z]+)/{}/g')
ATOMIC_MASS=$($PSQL "SELECT atomic_mass FROM elements INNER JOIN properties ON elements.atomic_number=properties.atomic_number WHERE elements.atomic_number='$ATOMIC_NUMBER'")
ATOMIC_MASS_FORMATTED=$(echo $ATOMIC_MASS | sed 's/[ ]*([0-9]+)/{}/g')
MELTING_POINT=$($PSQL "SELECT melting_point_celsius FROM elements INNER JOIN properties ON elements.atomic_number=properties.atomic_number WHERE elements.atomic_number='$ATOMIC_NUMBER'")
MELTING_POINT_FORMATTED=$(echo $MELTING_POINT | sed 's/[ ]*([0-9]+)/{}/g')
BOILING_POINT=$($PSQL "SELECT boiling_point_celsius FROM elements INNER JOIN properties ON elements.atomic_number=properties.atomic_number WHERE elements.atomic_number='$ATOMIC_NUMBER'")
BOILING_POINT_FORMATTED=$(echo $BOILING_POINT | sed 's/[ ]*([0-9]+)/{}/g')

echo -e "The element with atomic number $ATOMIC_NUMBER_FORMATTED is $NAME_FORMATTED ($SYMBOL_FORMATTED). It's a $TYPE_FORMATTED, with a mass of $ATOMIC_MASS_FORMATTED amu. $NAME_FORMATTED has a melting point of $MELTING_POINT_FORMATTED celsius and a boiling point of $BOILING_POINT_FORMATTED celsius."
fi