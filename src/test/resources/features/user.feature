Feature: User registration


  Scenario Outline: Create a new user
    Given User uses as "<browser>"
    And The user is on the registration page
    When User Enters Date of Birth "<birth_date>"
    And The user enters their first name "<first_name>"
    And The user enters his last name "<last_name>"
    But If last name is not specified "<last_name>"
    And The user enters his email address and confirms
    And The user enters their "<pass1>"
    And The user repeats his "<pass2>"
    And The User agrees to "<Terms and Conditions>"
    And The user accepts the age limit
    And The User approves Code of Ethics
    And The user clicks the registration button
    Then Should the user account be created successfully"<expected>"

    Examples:
      | browser | birth_date | first_name | last_name | pass1    | pass2    | Terms and Conditions | expected                |
      | Firefox | 12/12/1970 | Alexis     | Helis     | Dima2000 | Dima2000 | klick                | account_created         |
      | Firefox | 12/12/1970 | Alexis     |           | Dima2000 | Dima2000 | klick                | surname_missing         |
      | Firefox | 12/12/1970 | Alexis     | Helis     | Dima2000 | dima2000 | klick                | password_does_not_match |
      | Firefox | 12/12/1970 | Alexis     | Helis     | Dima2000 | Dima2000 |                      | terms_and_conditions    |

    Examples:
      | browser | birth_date | first_name | last_name | pass1    | pass2    | Terms and Conditions | expected                |
      | Edge    | 12/12/1970 | Alexis     | Helis     | Dima2000 | Dima2000 | klick                | account_created         |
      | Edge    | 12/12/1970 | Alexis     |           | Dima2000 | Dima2000 | klick                | surname_missing         |
      | Edge    | 12/12/1970 | Alexis     | Helis     | Dima2000 | dima2000 | klick                | password_does_not_match |
      | Edge    | 12/12/1970 | Alexis     | Helis     | Dima2000 | Dima2000 |                      | terms_and_conditions    |

    Examples:
      | browser | birth_date | first_name | last_name | pass1    | pass2    | Terms and Conditions | expected                |
      | Chrome  | 12/12/1970 | Alexis     | Helis     | Dima2000 | Dima2000 | klick                | account_created         |
      | Chrome  | 12/12/1970 | Alexis     |           | Dima2000 | Dima2000 | klick                | surname_missing         |
      | Chrome  | 12/12/1970 | Alexis     | Helis     | Dima2000 | dima2000 | klick                | password_does_not_match |
      | Chrome  | 12/12/1970 | Alexis     | Helis     | Dima2000 | Dima2000 |                      | terms_and_conditions    |
