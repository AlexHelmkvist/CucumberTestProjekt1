Feature:

  Scenario Outline: Web purchase
    Given User is using "<browser>"
    Given The User navigates to the website
    When The user types search "<words>"
    And The user "<selects>" the desired product
    And The user "<places>" an item in the cart
    Then The user goes to the shopping "<cart>"


    Examples:

      | browser | words   | selects | places | cart |
      | Chrome  | påskägg | påskägg | click  | cart |
      | Chrome  | käpp    | käpp    | click  | cart |
      | Chrome  | prime   | prime   | click  | cart |
      | Chrome  | godis   | godis   | click  | cart |

    Examples:

      | browser | words   | selects | places | cart |
      | Firefox | påskägg | påskägg | click  | cart |
      | Firefox | käpp    | käpp    | click  | cart |
      | Firefox | prime   | prime   | click  | cart |
      | Firefox | godis   | godis   | click  | cart |

    Examples:

      | browser | words   | selects | places | cart |
      | Edge    | påskägg | påskägg | click  | cart |
      | Edge    | käpp    | käpp    | click  | cart |
      | Edge    | prime   | prime   | click  | cart |
      | Edge    | godis   | godis   | click  | cart |





