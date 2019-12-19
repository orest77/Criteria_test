*** Settings ***
Library  client.client_helper
Resource  resource.robot

*** Keywords ***
Підготувати слієнт для адміністратора
  Log  ${RESOURCE}
  Log  ${API_HOST_URL}
  Log  ${API_VERSION}
  ${API_CLIENT}  prepare api wrapper  ${USERNAME}  ${PASSWORD}  ${API_HOST_URL}  ${API_VERSION}
  Set Suite Variable  ${API_CLIENT}
  Log Variables


Створити критерію
  [Arguments]  ${DATA}
  ${RESPONSE}  call method  ${API_CLIENT}  create_criteria  ${RESOURCE}  ${DATA}
  log  ${RESPONSE}
  Log Variables
  [Return]  ${RESPONSE}

Переглядати список критеріїв
  ${RESPONSE}  call method  ${API_CLIENT}  get_criteria  ${RESOURCE}
  log  ${RESPONSE}
  Log Variables
  [Return]  ${RESPONSE}

Переглядати критерію
  [Arguments]  ${ID}
  ${RESPONSE}  call method  ${API_CLIENT}  get_criteria  ${RESOURCE}  ${ID}
  log  ${RESPONSE}
  Log Variables
  [Return]  ${RESPONSE}


Змінити критерію
  [Arguments]  ${ID}  ${EDIT_DATA}
  ${RESPONSE}  call method  ${API_CLIENT}  update_criteria  ${ID}  ${RESOURCE}  ${EDIT_DATA}
  log  ${RESPONSE}
  Log Variables
  [Return]  ${RESPONSE}

Видаляти критерію
  [Arguments]  ${ID}
  ${RESPONSE}  call method  ${API_CLIENT}  delete_criteria  ${ID}  ${RESOURCE}
  log  ${RESPONSE}
  Log Variables
  [Return]  ${RESPONSE}

