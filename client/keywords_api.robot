*** Settings ***
Library  client.client_helper
Resource  resource.robot

*** Keywords ***
Підготувати слієнт для адміністратора
  Log  ${RESOURCE}
  Log  ${API_HOST_URL}
  Log  ${API_VERSION}
  ${api_wrapper}  prepare api wrapper  ${USERNAME}  ${PASSWORD}  ${API_HOST_URL}  ${API_VERSION}
  Log Variables
  [Return]  ${api_wrapper}


Підготувати слієнт для користувача
  Log  ${RESOURCE}
  Log  ${API_HOST_URL}
  Log  ${API_VERSION}
  ${api_wrapper}  prepare api wrapper  ${USERNAME}  ${PASSWORD}  ${API_HOST_URL}  ${API_VERSION}
  Log Variables
  [Return]  ${api_wrapper}