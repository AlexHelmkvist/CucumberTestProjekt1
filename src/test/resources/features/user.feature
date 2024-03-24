Feature: User registration


  Scenario Outline: Create a new user
    Given User uses "Chrome" as browser
    And The user is on the registration page
    When User Enters Date of Birth "<birth_date>"
    And The user enters their first name "<first_name>"
    And The user enters his last name "<last_name>"
    But If last name is not specified "<last_name>"
    And The user enters his email address and confirms
    And The user enters their "<pass1>"
    And The user repeats his "<pass2>"
    But If the password is confirmed with another "<pass2>"
    And The User agrees to "<Terms and Conditions>" "klick"
    But If the user does not accept "<Terms and Conditions>"
    And The user accepts the age limit
    And The User approves Code of Ethics
    And The user clicks the registration button
    Then Should the user account be created successfully"<expected>" "account_created"
    Then Should the user get an error message that the surname is missing "<expected>" "surname_missing"
    Then Should the user receive an error message that the passwords do not match "<expected>" "password_does_not_match"
    Then the user should receive an error message that the terms must be accepted "<expected>" "terms_and_conditions"

    Examples:
      | birth_date | first_name | last_name | pass1    | pass2    | Terms and Conditions | expected                |
      | 12/12/1970 | Alexis     | Helis     | Dima2000 | Dima2000 | klick                | account_created         |
      | 12/12/1970 | Alexis     |           | Dima2000 | Dima2000 | klick                | surname_missing         |
      | 12/12/1970 | Alexis     | Helis     | Dima2000 | dima2000 | klick                | password_does_not_match |
      | 12/12/1970 | Alexis     | Helis     | Dima2000 | Dima2000 |                      | terms_and_conditions    |

  Scenario Outline: Create a new user
    Given User uses "Firefox" as browser
    And The user is on the registration page
    When User Enters Date of Birth "<birth_date>"
    And The user enters their first name "<first_name>"
    And The user enters his last name "<last_name>"
    But If last name is not specified "<last_name>"
    And The user enters his email address and confirms
    And The user enters their "<pass1>"
    And The user repeats his "<pass2>"
    But If the password is confirmed with another "<pass2>"
    And The User agrees to "<Terms and Conditions>" "klick"
    But If the user does not accept "<Terms and Conditions>"
    And The user accepts the age limit
    And The User approves Code of Ethics
    And The user clicks the registration button
    Then Should the user account be created successfully"<expected>" "account_created"
    Then Should the user get an error message that the surname is missing "<expected>" "surname_missing"
    Then Should the user receive an error message that the passwords do not match "<expected>" "password_does_not_match"
    Then the user should receive an error message that the terms must be accepted "<expected>" "terms_and_conditions"

    Examples:
      | birth_date | first_name | last_name | pass1    | pass2    | Terms and Conditions | expected                |
      | 12/12/1970 | Alexis     | Helis     | Dima2000 | Dima2000 | klick                | account_created         |
      | 12/12/1970 | Alexis     |           | Dima2000 | Dima2000 | klick                | surname_missing         |
      | 12/12/1970 | Alexis     | Helis     | Dima2000 | dima2000 | klick                | password_does_not_match |
      | 12/12/1970 | Alexis     | Helis     | Dima2000 | Dima2000 |                      | terms_and_conditions    |

  Scenario Outline: Create a new user
    Given User uses "Edge" as browser
    And The user is on the registration page
    When User Enters Date of Birth "<birth_date>"
    And The user enters their first name "<first_name>"
    And The user enters his last name "<last_name>"
    But If last name is not specified "<last_name>"
    And The user enters his email address and confirms
    And The user enters their "<pass1>"
    And The user repeats his "<pass2>"
    But If the password is confirmed with another "<pass2>"
    And The User agrees to "<Terms and Conditions>" "klick"
    But If the user does not accept "<Terms and Conditions>"
    And The user accepts the age limit
    And The User approves Code of Ethics
    And The user clicks the registration button
    Then Should the user account be created successfully"<expected>" "account_created"
    Then Should the user get an error message that the surname is missing "<expected>" "surname_missing"
    Then Should the user receive an error message that the passwords do not match "<expected>" "password_does_not_match"
    Then the user should receive an error message that the terms must be accepted "<expected>" "terms_and_conditions"

    Examples:
      | birth_date | first_name | last_name | pass1    | pass2    | Terms and Conditions | expected                |
      | 12/12/1970 | Alexis     | Helis     | Dima2000 | Dima2000 | klick                | account_created         |
      | 12/12/1970 | Alexis     |           | Dima2000 | Dima2000 | klick                | surname_missing         |
      | 12/12/1970 | Alexis     | Helis     | Dima2000 | dima2000 | klick                | password_does_not_match |
      | 12/12/1970 | Alexis     | Helis     | Dima2000 | Dima2000 |                      | terms_and_conditions    |
