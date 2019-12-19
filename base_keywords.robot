*** Settings ***
Library  Collections
Resource  client/keywords_api.robot
Resource  data/keywords_data.robot


*** Keywords ***
Можливість cтворити критерію
  ${DATA}  Піготувати дані для критерії
  #${api_client}  Підготувати слієнт для адміністратора
  ${RESPONSE}  Створити критерію  ${DATA}
  Set Suite Variable  ${ID_CRITERIA}  ${RESPONSE.id}
  [Return]  ${RESPONSE}

Можливість переглядати список критеріїв
  ${RESPONSE}  Переглядати список критеріїв
  log  ${RESPONSE}
  Log Variables
  [Return]  ${RESPONSE}

Можливість переглядати критерію
  ${RESPONSE}  Переглядати критерію  ${ID_CRITERIA}
  log  ${RESPONSE}
  Log Variables
  [Return]  ${RESPONSE}

Можливість змінити критерію
  ${EDIT_DATA}  Підготувати дані для редагування
  ${RESPONSE}  Змінити критерію  ${ID_CRITERIA}  ${EDIT_DATA}
  log  ${RESPONSE}
  Log Variables
  [Return]  ${RESPONSE}

Можливість видаляти критерію
  ${RESPONSE}  Видаляти критерію  ${ID_CRITERIA}
  log  ${RESPONSE}
  Log Variables
  [Return]  ${RESPONSE}

