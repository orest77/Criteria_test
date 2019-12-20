*** Settings ***
Library  Collections
Resource  client/keywords_api.robot
Resource  data/keywords_data.robot


*** Keywords ***
Можливість cтворити критерію
  [Arguments]  ${username}
  ${CRITERIA_DATA}  Піготувати дані для критерії
  Set Suite Variable  ${CRITERIA_DATA}
  ${RESPONSE}  Створити критерію  ${CRITERIA_DATA}  ${username}
  Set Suite Variable  ${ID_CRITERIA}  ${RESPONSE}
  [Return]  ${RESPONSE}

Можливість переглядати список критеріїв
  [Arguments]  ${username}
  ${RESPONSE}  Переглядати список критеріїв  ${username}
  log  ${RESPONSE}
  Log Variables
  [Return]  ${RESPONSE}

Можливість переглядати критерію
  [Arguments]  ${username}
  ${RESPONSE}  Переглядати критерію  ${ID_CRITERIA}  ${username}
  log  ${RESPONSE}
  Log Variables
  [Return]  ${RESPONSE}

Можливість змінити критерію
  [Arguments]  ${username}
  ${EDIT_DATA}  Підготувати дані для редагування
  Set Suite Variable  ${EDIT_DATA}
  ${RESPONSE}  Змінити критерію  ${ID_CRITERIA}  ${EDIT_DATA}  ${username}
  log  ${RESPONSE}
  Log Variables
  [Return]  ${RESPONSE}

Можливість видаляти критерію
  [Arguments]  ${username}
  ${RESPONSE}  Видаляти критерію  ${ID_CRITERIA}  ${username}
  log  ${RESPONSE}
  Log Variables
  [Return]  ${RESPONSE}


#################################################

