*** Settings ***
Library  ClientCriteria
Library  Collections
Library  init_data.py

Resource  resource.robot

*** Keywords ***
CreareCriteria
  ${resonses}  create criteria  ${RESOURCE}  data_for_criteria
  [Return]  ${resonses.id}