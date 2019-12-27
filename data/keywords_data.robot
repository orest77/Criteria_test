*** Settings ***
Library  data.init_data

*** Keywords ***
Піготувати дані для критерії
  ${CRITERIA_DATA}  data for criteria  1  12  15  37
  log  ${CRITERIA_DATA}
  [Return]  ${CRITERIA_DATA}

Підготувати дані для редагування
  ${EDIT_DATA}  data_for_edit  6  17  23  31
  log  ${EDIT_DATA}
  [Return]  ${EDIT_DATA}