*** Settings ***
Library    DatabaseLibrary
Library    String
Library    Dialogs

*** Variables ***
${DB_MODULE_NAME} =    pymysql
${DB_NAME} =    zidship_db
${DB_USERNAME} =    a.tarek@zid.sa
${DB_PASSWORD} =    Tarek12345
${DB_HOST} =    hostURL
${DB_PORT} =    PORT

*** Keywords ***
# TODO    Move this to a whatever
Connect
    connect to database    ${DB_MODULE_NAME}    ${DB_NAME}  ${DB_USERNAME}  ${DB_PASSWORD}  ${DB_HOST}  ${DB_PORT}

Disconnect
    disconnect from database