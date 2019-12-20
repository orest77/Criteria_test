*** Settings ***
Resource  base_keywords.robot
Suite Setup    Підготувати клієнт для користувача

*** Variables ***
@{USED_ROLES}  admin  user

*** Test Cases ***
Тест створити критерію
  Можливість cтворити критерію  admin
  Можливість переглядати список критеріїв  admin
  Можливість переглядати критерію  admin
  Можливість змінити критерію  admin
  Можливість видаляти критерію  admin