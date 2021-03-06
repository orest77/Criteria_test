*** Settings ***
Resource  base_keywords.robot
Suite Setup    Підготувати клієнт для користувача
*** Variables ***
@{USED_ROLES}  admin  user

*** Test Cases ***
Тест створити критерію
  Можливість cтворити критерію  admin
  Перевірити створену критерію по ідентифікатору  admin
  Перевірити створену критерію по ідентифікатору  user

Тест редагувати критерію
  ## змінює наступні полля name, nameEng, minValue, maxValue
  Можливість змінити критерію  admin
  Перевірити редагування критерії  admin
  Перевірити редагування критерії  user

Тест перевірити кількість критерій
  Можливість переглядати список критеріїв  admin
  Перевірити список критерій  admin
  Перевірити список критерій  user

Тест видалення критерії
  Можливість видаляти критерію  admin
  Перевірити чи критерія видалена  admin
  Перевірити чи критерія видалена  user
  Перевірити чи критерія появилася в статусі  admin  ${STATUS_RETIRED}
  Перевірити чи критерія появилася в статусі  user  ${STATUS_RETIRED}

Тест на відсутність можливості видалити критерію
  Можливість cтворити критерію  admin
  Перевірити відсутність доступу користувача до видалення критерії  user

Тест на відсутність можливості користувачем створити критерію
  Перевірити відсутність доступу користувача до створення критерії  user

Тест на відсутність доступу користувачем змінити критерію
  Перевірити відсутність доступу користувача до можливості змінити критерію  user

Тест змінити критерію на статус відхилено
  Перевірити критерію на зміну статусу  admin  retired
  Перевірити чи критерія появилася в статусі  admin  ${STATUS_RETIRED}
  Перевірити чи критерія появилася в статусі  user  ${STATUS_RETIRED}

Тест змінити критерію на статус активний
  Перевірити критерію на зміну статусу  admin  active
  Перевірити чи критерія появилася в статусі  admin  ${STATUS_ACTIVE}
  Перевірити чи критерія появилася в статусі  user  ${STATUS_ACTIVE}

Тест на цілісність структурии критерії при зміні статусу
  Можливість cтворити критерію  admin
  Перевірка цілісності даних критерії при змінювані статусу  admin
  Перевірка цілісності даних критерії при змінювані статусу  user

Тест на відсутність можливості створити критерію з некоректним ід-кодом в рядку класифікація
  Перевірити відсутність можливості створити критерію з некоректним ід-кодом в класифікації  admin  92350000-1
  Перевірити відсутність можливості створити критерію з некоректним ід-кодом в класифікації  admin  92350000-003
  Перевірити відсутність можливості створити критерію з некоректним ід-кодом в класифікації  admin  92350000

Тест на відсутність можливості створити критерію з некоректним ід-кодом в рядку допоміжна класифікація
  Перевірити відсутність можливості створити критерію з некоректним даними в допоміжній класифікації  admin  id  031f4100-4
  Перевірити відсутність можливості створити критерію з некоректним даними в допоміжній класифікації  admin  id  031f4100-456
  Перевірити відсутність можливості створити критерію з некоректним даними в допоміжній класифікації  admin  scheme  ДК02

Тест на відсутність можливості максимальне значення зробити меншим від мінімального
  Перевірити відсутність можливості змінити масимальне значення менше від мінімального  admin  21  3

Тест на відсутність можливості створити критерію з неправильно одиницею виміру
  Перевірити відсутність можливості змінити на некоректну одиницю виміру  admin  KGR

Тест перевіряє чи повертається коректний опис класифікації при некоректному початковому вводі
  Перевірити авто допис при некоректному вводі данних  admin  classification  error_value

Тест перевіряє чи повертається коректний опис допоміжної класифікації при некоректному початковому вводі
  Перевірити авто допис при некоректному вводі данних  admin  additionalClassification  помилкові дані