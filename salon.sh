#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n ~~~~~ MY SALON ~~~~~"

MAIN_MENU() {

  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

  echo -e "\n1) service1\n2) service2\n3) service3"
  read SERVICE_ID_SELECTED

  case $SERVICE_ID_SELECTED in
    1) SERVICE1 $SERVICE_ID_SELECTED ;;
    2) SERVICE2 $SERVICE_ID_SELECTED ;;
    3) SERVICE3 $SERVICE_ID_SELECTED ;;
    *) MAIN_MENU "I could not find that service. What would you like today?"
  esac
}

SERVICE1() {
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_NAME ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    CUSTOMER_INSERT_RESULT=$($PSQL "INSERT INTO customers (phone, name) VALUES ('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
  fi

  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

  echo -e "\nWhat time would you like your service1, $CUSTOMER_NAME?"
  read  SERVICE_TIME

  APPOINTMENT_INSERT_RESULT=$($PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ('$CUSTOMER_ID', '$1', '$SERVICE_TIME')")
  echo -e "\nI have put you down for a service1 at $SERVICE_TIME, $CUSTOMER_NAME."
}
SERVICE2() {
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_NAME ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    CUSTOMER_INSERT_RESULT=$($PSQL "INSERT INTO customers (phone, name) VALUES ('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
  fi

  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

  echo -e "\nWhat time would you like your service2, $CUSTOMER_NAME?"
  read  SERVICE_TIME

  APPOINTMENT_INSERT_RESULT=$($PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ('$CUSTOMER_ID', '$1', '$SERVICE_TIME')")
  echo -e "\nI have put you down for a service2 at $SERVICE_TIME, $CUSTOMER_NAME."
}
SERVICE3() {
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_NAME ]]
  then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    CUSTOMER_INSERT_RESULT=$($PSQL "INSERT INTO customers (phone, name) VALUES ('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
  fi

  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")

  echo -e "\nWhat time would you like your service3, $CUSTOMER_NAME?"
  read  SERVICE_TIME

  APPOINTMENT_INSERT_RESULT=$($PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ('$CUSTOMER_ID', '$1', '$SERVICE_TIME')")
  echo -e "\nI have put you down for a service3 at $SERVICE_TIME, $CUSTOMER_NAME."
}


MAIN_MENU "Welcome to My Salon, how can I help you?"