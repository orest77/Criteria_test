*** Settings ***
#Library  client.criteria_client.ClientCriteria
Library  data.init_data
Resource  resource.robot
Library  Collections
Library  client.client_helper


*** Keywords ***
Підготувати слієнт для адміністратора
  Log  ${RESOURCE}
  Log  ${API_HOST_URL}
  Log  ${API_VERSION}
  ${api_wrapper}  prepare api wrapper  admin  adminpassword  ${API_HOST_URL}  ${API_VERSION}
  Log Variables

Піготувати дані для критерії
  #[Arguments]  ${criteria_data}
  ${criteria_data}  data for criteria
  Log  ${criteria_data}
  [Return]  ${criteria_data}

Створити критерію
  #${data}  data_for_criteria
  ${data}  Піготувати дані для критерії
  #${response}  create criteria  ${RESOURCE}  ${data}
  ${api_client}  Підготувати слієнт для адміністратора
  ${response}  ${api_client}.create criteria  ${RESOURCE}  ${data}
  log  ${response}
  [Return]  ${response.id}