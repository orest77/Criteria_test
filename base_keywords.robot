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
  Set Suite Variable  ${RESPONSE}
  [Return]  ${RESPONSE}

Можливість переглядати список критеріїв
  [Arguments]  ${user_name}
  ${GET_RESPONSE}  Переглядати список критеріїв  ${user_name}
  log  ${GET_RESPONSE}
  Log Variables
  [Return]  ${GET_RESPONSE}

Можливість переглядати критерію
  [Arguments]  ${user_name}
  ${GET_RESPONSE_ID}  Переглядати критерію  ${ID_CRITERIA}  ${user_name}
  log  ${GET_RESPONSE_ID}
  Log Variables
  [Return]  ${GET_RESPONSE_ID}

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


#################################################
########Перевірки для критерії##################
###############################################

Перевірити створену критерію
  [Arguments]  ${user_name}
  ${get_criteria}  Можливість переглядати критерію  ${user_name}
  Порівняти дані критерії  ${get_criteria}  ${CRITERIA_DATA}



Перевірити редагування критерії
    [Arguments]  ${user_name}
    ${get_criteria}  Можливість переглядати критерію  ${user_name}
    Порівнняти редаговані дані  ${get_criteria}  ${EDIT_DATA}


##################
#####ASSERT######
################

Порівняти дані критерії
  [Arguments]  ${actual_resul}  ${expected_result}
  log  ${actual_resul}
  log  ${expected_result}
  remove from dictionary  ${actual_resul}  id
  remove from dictionary  ${actual_resul}  status
  remove from dictionary  ${actual_resul}  dateModified
  dictionaries should be equal  ${actual_resul}  ${expected_result}  msg=Objects are not equal


Порівнняти редаговані дані
  [Arguments]  ${actual_resul}  ${expected_result}
  log  ${actual_resul}
  log  ${expected_result}
  should be equal  ${actual_resul.name}  ${expected_result.name}  msg=Objects NAME are not equal
  should be equal  ${actual_resul.nameEng}  ${expected_result.nameEng}  msg=Objects NAME_ENG are not equal
  should be equal  ${actual_resul.minValue}  ${expected_result.minValue}  msg=Objects MIN_VALUE are not equal
  should be equal  ${actual_resul.maxValue}  ${expected_result.maxValue}  msg=Objects MAX_VALUE are not equal
  should be equal  ${actual_resul.status}  ${expected_result.status}  msg=Objects STATUS are not equal


