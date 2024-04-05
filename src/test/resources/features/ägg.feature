Feature:

  Scenario Outline: Web purchase
    Given User is using "<browser>"
    Given The User navigates to the website
    When The user types search "<words>"
    And The user "<selects>" the desired product
    And The user "<places>" an item in the cart
    Then The user goes to the shopping "<cart>"

    Examples:
      | browser | words     | selects   | places | cart |
      | Edge    | påskägg   | påskägg   | click  |      |
      | Edge    | godis     | godis     | click  |      |
      | Edge    | prime     | prime     | click  |      |
      | Edge    | ballonger | ballonger | click  | cart |
    Examples:

      | browser | words     | selects   | places | cart |
      | Firefox | påskägg   | påskägg   | click  |      |
      | Firefox | godis     | godis     | click  |      |
      | Firefox | prime     | prime     | click  |      |
      | Firefox | ballonger | ballonger | click  | cart |

    Examples:
      | browser | words     | selects   | places | cart |
      | Chrome  | påskägg   | påskägg   | click  |      |
      | Chrome  | godis     | godis     | click  |      |
      | Chrome  | prime     | prime     | click  |      |
      | Chrome  | ballonger | ballonger | click  | cart |



