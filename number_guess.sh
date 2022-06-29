#!/bin/bash
# script that generates a random number between 1 and 1000 for users to guess.

PSQL="psql -X --username=freecodecamp --dbname=number_guess -t --no-align -c"

#Truncate table while testing
#TRUNCATE_RESULT=$($PSQL "TRUNCATE TABLE users")
#INSERT_TEST=$($PSQL "INSERT INTO users(user_name,games_played,best_game) VALUES('gargriff',10,15);")

PLAY_GAME() {

  #increase number of games played
  GAMES_PLAYED=$[ $GAMES_PLAYED + 1 ]

  #randomly generate a number that users have to guess
  SECRET_NUMBER=$[ $RANDOM % 1000 + 1 ]
 
  # Prompt user to guess number
  echo "Guess the secret number between 1 and 1000:"
  NUMBER_OF_GUESSES=0
  while :
  do 
    read USER_GUESS
    NUMBER_OF_GUESSES=$[ $NUMBER_OF_GUESSES + 1 ]

    #echo "Number of guesses = $NUMBER_OF_GUESSES"
    # Check whether guess is an integer
    if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
    then 
   
      echo "That is not an integer, guess again:"
   
    elif [[ $USER_GUESS -gt $SECRET_NUMBER ]]
    then
    
      echo "It's lower than that, guess again:"
  
    elif [[ $USER_GUESS -lt $SECRET_NUMBER ]]
    then 

      echo "It's higher than that, guess again:"

    else

      echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
    
      break
    fi
  done

  #Update database with games_played and best_game
  #echo "Games played = $GAMES_PLAYED"
  if [[ $BEST_GAME -gt $NUMBER_OF_GUESSES ]]
  then
    BEST_GAME=$NUMBER_OF_GUESSES
  fi

  #echo "Best game = $BEST_GAME"
  INSERT_DETAILS_RESULT=$($PSQL "UPDATE users set games_played=$GAMES_PLAYED where user_name='$USERNAME'")
  INSERT_DETAILS_RESULT=$($PSQL "UPDATE users set best_game=$BEST_GAME where user_name='$USERNAME'")
}


#Prompt for username
echo "Enter your username:" 
read USERNAME

# get user_id from database
USER_ID=$($PSQL "SELECT user_id FROM users WHERE user_name='$USERNAME'")
    
# if user id not found
if [[ -z $USER_ID ]]
then
  # insert username into database
  INSERT_USERNAME_RESULT=$($PSQL "INSERT INTO users(user_name,games_played,best_game) VALUES('$USERNAME',0,1000)")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  BEST_GAME=1000
  PLAY_GAME

else
  # get username details from database
  
  GAMES_PLAYED=$($PSQL "SELECT games_played from users where user_name='$USERNAME'")
  BEST_GAME=$($PSQL "SELECT best_game from users where user_name='$USERNAME'")
  
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."

  PLAY_GAME

fi
