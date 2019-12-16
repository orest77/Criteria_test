*** Settings ***
Library  client.criteria_client.ClientCriteria
Library  data.init_data

Resource  resource.robot

*** Keywords ***
Creare Criteria
  ${resonses}  create criteria  ${RESOURCE}  data_for_criteria
  [Return]  ${resonses.id}