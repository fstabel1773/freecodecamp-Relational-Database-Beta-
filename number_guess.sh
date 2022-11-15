#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

MAGIC_NUM=$((1 + $RANDOM % 1000))

# prompt for username-input
echo -e "Enter your username:"
read USERNAME

# DB-Query Username
USERNAME_RESULT=$($PSQL "SELECT username FROM users WHERE username='$USERNAME'")


# if user is known
if [[ ! -z $USERNAME_RESULT ]]
then
  # get user_id for queries
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")

  # query and format db for output-info
    # FORMATTING NECCESSERY? -> initial psql statement!
  #USERNAME_RESULT_FORMATTED=
  GAMES_PLAYED=$($PSQL "SELECT COUNT(game_id) FROM games WHERE user_id='$USER_ID'")
  #GAMES_PLAYED_FORMATTED=
  BEST_GAME=$($PSQL "SELECT MIN(guesses_to_win) FROM games WHERE user_id='$USER_ID'")
  #BEST_GAME_FORMATTED=


  # print output
  echo "Welcome back, $USERNAME_RESULT! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."

# if new user
else
NEW_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
  # get user_id for queries
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")

  # print welcome-message
  echo "Welcome, $USERNAME! It looks like this is your first time here."
fi

echo -e "Guess the secret number between 1 and 1000:"
read GUESS_NUM
NUMBER_OF_GUESSES=1

# test for integer input only
while ! [[ $GUESS_NUM =~ ^[0-9]+$ ]]
do
echo "That is not an integer, guess again:"
read GUESS_NUM
# Hier NUMBER_OF_GUESSES zählen?
done

while ! [[ $GUESS_NUM = $MAGIC_NUM ]] # ! vor Klammer?
do
  if [[ $GUESS_NUM > $MAGIC_NUM ]]
  then
  echo "It's lower than that, guess again:"
  else
  echo "It's higher than that, guess again:"
  fi
read GUESS_NUM
NUMBER_OF_GUESSES=$(($NUMBER_OF_GUESSES + 1))
  # test for integer input only
  while ! [[ $GUESS_NUM =~ ^[0-9]+$ ]]
  do
  echo "That is not an integer, guess again:"
  read GUESS_NUM
  # Hier NUMBER_OF_GUESSES zählen?
  done
done
#NUMBER_OF_GUESSES=$(($NUMBER_OF_GUESSES + 1)) # final count

# NUMBER_OF_GUESSES_FORMATTED=
GUESSES_TO_WIN=$($PSQL "INSERT INTO games (user_id, guesses_to_win) VALUES ($USER_ID, $NUMBER_OF_GUESSES)")
echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $MAGIC_NUM. Nice job!"
