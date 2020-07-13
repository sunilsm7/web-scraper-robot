*** Settings ***
Documentation     Web scraper robot. Stores tweets.
Resource          keywords.robot
Variables         variables.py

*** Tasks ***
Store the latest tweets by given user name
    Store the latest ${NUMBER_OF_TWEETS} tweets by user name "${USER_NAME}"