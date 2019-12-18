*** Settings ***
Library  data.init_data
Resource  resource.robot
Library  client.client_helper
Library  String
Library  Collections
Library  OperatingSystem
Library  DateTime
Library  DebugLibrary


*** Keywords ***
Підготувати слієнт для адміністратора
  Log  ${RESOURCE}
  Log  ${API_HOST_URL}
  Log  ${API_VERSION}
  ${api_wrapper}  prepare api wrapper  ${USERNAME}  ${PASSWORD}  ${API_HOST_URL}  ${API_VERSION}
  Log Variables
  [Return]  ${api_wrapper}


Піготувати дані для критерії
  ${criteria_data}  data for criteria
  Log  ${criteria_data}
  [Return]  ${criteria_data}

Створити критерію
  ${DATA}  Піготувати дані для критерії
  #${response}  create criteria  ${RESOURCE}  ${data}
  ${api_client}  Підготувати слієнт для адміністратора
  ${RESPONSE}  call method  ${api_client}  create_criteria  ${RESOURCE}  ${DATA}
  log  ${RESPONSE}
  [Return]  ${RESPONSE}