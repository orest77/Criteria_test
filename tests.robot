*** Settings ***
Resource  base_keywords.robot
Suite Setup    Підготувати клієнт для користувача
*** Variables ***
@{USED_ROLES}  admin  user

*** Test Cases ***
Тест створити критерію
  [Tags]   ${USERS.users.${username}.client}
  Можливість cтворити критерію  admin
  Перевірити створену критерію  admin
  Перевірити створену критерію  user

Тест редагувати критерію
  [Tags]   ${USERS.users.${username}.client}
  Можливість змінити критерію  admin
  Перевірити редагування критерії  admin
  Перевірити редагування критерії  user
  #Можливість переглядати список критеріїв  admin
  #Можливість переглядати критерію  admin
  #Можливість видаляти критерію  admin