*** Settings ***
Library  client.criteria_client.ClientCriteria
Library  data.init_data

Resource  resource.robot

*** Keywords ***
Creare Criteria
  ${data}  data_for_criteria
  ${response}  create criteria  ${RESOURCE}  ${data}
  [Return]  ${response}