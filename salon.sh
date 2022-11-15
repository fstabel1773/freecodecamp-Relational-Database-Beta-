#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n\n ~~~~~ Salon Appointment Scheduler ~~~~~\n"


SERVICE_OFFER() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  # display a numbered list of services
  echo -e "Please choose a service."
  SERVICE_OFFER=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
  echo "$SERVICE_OFFER" | while read SERVICE_ID BAR SERVICE_NAME
  do
    echo "$SERVICE_ID) $SERVICE_NAME"
  done
  SERVICE_SELECTION_MENU
}

SERVICE_SELECTION_MENU() {
  # pick a service
  read SERVICE_ID_SELECTED
  SERVICE_ID_MAX=$($PSQL "SELECT MAX(service_id) FROM services")
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    SERVICE_OFFER "No valid service-number. Please choose a valid service-id."
  elif [[ $SERVICE_ID_SELECTED > $SERVICE_ID_MAX ]]
  then
    SERVICE_OFFER "No valid service-number. Please choose a valid service-id."
  else
    # get customer info
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE

    CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")

      # if not yet a customer
     if [[ -z $CUSTOMER_NAME ]]
     then
      # get customer name
      echo -e "\nWhat's your name?"
      read CUSTOMER_NAME

      # insert new customer
      CUSTOMER_NAME_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    fi
    # get customer_id
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
    
  # fix appointment 
    # get service_time
    echo -e "\nWhat's your prefered service time?"
    read SERVICE_TIME
      
    # insert appointment
    APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
  
    # final message
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
    echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
  
  fi
}

SERVICE_OFFER