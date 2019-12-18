*** Settings ***
Library  Collections
Resource  client/keywords_api.robot
Resource  data/keywords_data.robot

*** Keywords ***
Створити критерію
  ${DATA}  Піготувати дані для критерії
  ${api_client}  Підготувати слієнт для адміністратора
  ${RESPONSE}  call method  ${api_client}  create_criteria  ${RESOURCE}  ${DATA}
  log  ${RESPONSE}
  Log Variables
  [Return]  ${RESPONSE}

Переглядати список критеріїв
  ${api_client}  Підготувати слієнт для адміністратора
  ${RESPONSE}  call method  ${api_client}  get_criteria  ${RESOURCE}
  log  ${RESPONSE}
  Log Variables
  [Return]  ${RESPONSE}

Переглядати критерію
  ${CRITERIA}  Створити критерію
  ${api_client}  Підготувати слієнт для адміністратора
  ${RESPONSE}  call method  ${api_client}  get_criteria  ${RESOURCE}  ${CRITERIA.id}
  log  ${RESPONSE}
  Log Variables
  [Return]  ${RESPONSE}


Змінити критерію
  ${api_client}  Підготувати слієнт для адміністратора
  ${edit_data}  Підготувати дані для редагування
  ${CRITERIA}  Переглядати критерію
  ${RESPONSE}  call method  ${api_client}  update_criteria  ${CRITERIA.id}  ${RESOURCE}  ${edit_data}
  log  ${RESPONSE}
  Log Variables
  [Return]  ${RESPONSE}

Видаляти критерію
  ${api_client}  Підготувати слієнт для адміністратора
  ${CRITERIA}  Переглядати критерію
  ${RESPONSE}  call method  ${api_client}  delete_criteria  ${CRITERIA.id}  ${RESOURCE}
  log  ${RESPONSE}
  Log Variables
  [Return]  ${RESPONSE}