*** Settings ***
Library  data.init_data

*** Keywords ***
Піготувати дані для критерії
  ${criteria_data}  data for criteria
  log  ${criteria_data}
  [Return]  ${criteria_data}

Підготувати дані для редагування
  ${edit_data}  data_for_edit
  log  ${edit_data}
  [Return]  ${edit_data}