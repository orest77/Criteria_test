*** Settings ***
Library  Collections
Resource  client/keywords_api.robot
Resource  data/keywords_data.robot


*** Keywords ***
Можливість cтворити критерію
  [Arguments]  ${user_name}
  ${CRITERIA_DATA}  Піготувати дані для критерії
  Set Suite Variable  ${CRITERIA_DATA}
  ${RESPONSE}  Створити критерію  ${CRITERIA_DATA}  ${user_name}
  Set Suite Variable  ${ID_CRITERIA}  ${RESPONSE}
  [Return]  ${RESPONSE}

Можливість переглядати список критеріїв
  [Arguments]  ${user_name}
  ${GET_RESPONSE}  Переглядати список критеріїв  ${user_name}
  log  ${GET_RESPONSE}
  Log Variables
  [Return]  ${GET_RESPONSE}

Можливість переглядати критерію
  [Arguments]  ${user_name}
  ${GET_RESPONSE_BY_ID}  Переглядати критерію  ${ID_CRITERIA}  ${user_name}
  log  ${GET_RESPONSE_BY_ID}
  Log Variables
  [Return]  ${GET_RESPONSE_BY_ID}

Можливість змінити критерію
  [Arguments]  ${user_name}
  ${EDIT_DATA}  Підготувати дані для редагування
  Set Suite Variable  ${EDIT_DATA}
  ${PATCH_RESPONSE}  Змінити критерію  ${ID_CRITERIA}  ${EDIT_DATA}  ${user_name}
  log  ${PATCH_RESPONSE}
  set suite variable  ${PATCH_RESPONSE}
  [Return]  ${PATCH_RESPONSE}

Можливість видаляти критерію
  [Arguments]  ${user_name}
  ${RESPONSE}  Видаляти критерію  ${ID_CRITERIA}  ${user_name}
  log  ${RESPONSE}
  Log Variables
  [Return]  ${RESPONSE}

Можливість переглядати статус критерій
  [Arguments]  ${user_name}  ${status_url}
  ${GET_RESPONSE}  Переглянути статус критерій  ${status_url}  ${user_name}
  log  ${GET_RESPONSE}
  Log Variables
  [Return]  ${GET_RESPONSE}

Можливість змінити статус критерії
  [Arguments]  ${user_name}  ${status}
  ${STATUS_DATA}  Підготувати дані для редагування
  set to dictionary  ${STATUS_DATA}  status=${status}
  set suite variable  ${STATUS_DATA}
  ${PATCH_RESPONSE}  Змінити критерію  ${ID_CRITERIA}  ${STATUS_DATA}  ${user_name}
  log  ${PATCH_RESPONSE}
  set suite variable  ${PATCH_RESPONSE}
  [Return]  ${PATCH_RESPONSE}

#################################################
########Перевірки для критерії##################
###############################################

#
Перевірити чи критерія появилася в статусі
  [Arguments]  ${user_name}  ${status_path}
  ${get_status_criteria}  Можливість переглядати статус критерій  ${user_name}  ${status_path}
  Перевірити присутність критерії по статусу  ${get_status_criteria}  ${ID_CRITERIA}

Перевірити критерію на зміну статусу
  [Arguments]  ${user_name}  ${status}
  ${get_status_criteria}  Можливість змінити статус критерії  ${user_name}  ${status}
  log  ${get_status_criteria}
  Порівнняти відредаговані дані  ${get_status_criteria}  ${STATUS_DATA}


#
Перевірити створену критерію
  [Arguments]  ${user_name}
  ${get_criteria}  Можливість переглядати критерію  ${user_name}
  Порівняти дані критерії  ${get_criteria}  ${CRITERIA_DATA}

Перевірити редагування критерії
  [Arguments]  ${user_name}
  ${get_criteria}  Можливість переглядати критерію  ${user_name}
  Порівнняти відредаговані дані  ${get_criteria}  ${EDIT_DATA}

Перевірити список критерій
  [Arguments]  ${user_name}
  ${get_griteries}  Можливість переглядати список критеріїв  ${user_name}
  Звірити всі критерії з підрахунком  ${get_griteries}

Перевірити відсутність доступу користувача до створення критерії
  [Arguments]  ${user_name}
  ${create_criteria}  Run Keyword And Expect Error  *  Можливість cтворити критерію  ${user_name}
  ${expected_result}  convert to string  You do not have permission to perform this action.
  Звірити повідомення про помилку  ${create_criteria}  ${expected_result}

Перевірити відсутність доступу користувача до змінити критерію
  [Arguments]  ${user_name}
  ${create_criteria}  Run Keyword And Expect Error  *  Можливість змінити критерію  ${user_name}
  ${expected_result}  convert to string  You do not have permission to perform this action.
  Звірити повідомення про помилку  ${create_criteria}  ${expected_result}

Перевірити відсутність доступу користувача до видалення критерії
  [Arguments]  ${user_name}
  ${create_criteria}  Run Keyword And Expect Error  *  Можливість видаляти критерію  ${user_name}
  ${expected_result}  convert to string  You do not have permission to perform this action.
  Звірити повідомення про помилку  ${create_criteria}  ${expected_result}

Перевірити чи критерія видалена
  [Arguments]  ${user_name}
  ${get_criteria}  Можливість переглядати критерію  ${user_name}
  log  ${get_criteria.status}
  Перевірити статус критерії  ${get_criteria}

##################
#####ASSERT######
################

Перевірити статус критерії
  [Arguments]  ${actual_result}
  should be equal  ${actual_result.status}  retired

Перевірити присутність критерії по статусу
  [Arguments]  ${actual_result}  ${expected_result}
  ${index}  convert to integer  0
  ${actual}  convert to boolean  0
  :FOR  ${result}  IN  ${actual_result.results}
  \  ${actual}=  exit for loop if  '${actual_result.results[${index}].id}' == '${expected_result}'
  \  ${index}  ${index + 1}
  log  ${actual}
  should be true  ${actual}


Звірити повідомення про помилку
  [Arguments]  ${actual_result}  ${expeted_result}
  should contain  ${actual_result}  ${expeted_result}


Звірити всі критерії з підрахунком
  [Arguments]  ${actual_result}
  ${expected}  get variable value  ${actual_result.count}
  ${actual}  get length  ${actual_result.results}
  log  ${actual}
  should be equal  ${actual}  ${actual}

Порівняти дані критерії
  [Arguments]  ${actual_resul}  ${expected_result}
  log  ${actual_resul}
  log  ${expected_result}
  remove from dictionary  ${actual_resul}  id
  remove from dictionary  ${actual_resul}  status
  remove from dictionary  ${actual_resul}  dateModified
  dictionaries should be equal  ${actual_resul}  ${expected_result}  msg=Objects are not equal

Порівнняти відредаговані дані
  [Arguments]  ${actual_resul}  ${expected_result}
  log  ${actual_resul}
  log  ${expected_result}
  should be equal  ${actual_resul.name}  ${expected_result.name}  msg=Objects NAME are not equal
  should be equal  ${actual_resul.nameEng}  ${expected_result.nameEng}  msg=Objects NAME_ENG are not equal
  should be equal  ${actual_resul.minValue}  ${expected_result.minValue}  msg=Objects MIN_VALUE are not equal
  should be equal  ${actual_resul.maxValue}  ${expected_result.maxValue}  msg=Objects MAX_VALUE are not equal
  should be equal  ${actual_resul.status}  ${expected_result.status}  msg=Objects STATUS are not equal


