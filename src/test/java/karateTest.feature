Feature: Test of APIS
 @Exercise1
  Scenario Outline: Create user <idcase>
    Given url 'https://petstore.swagger.io/v2/user'
    When request
    """
    {
  "<id>": <Vid>,
  "<username>": "<Vusername>",
  "<firstName>": "<VfirstName>",
  "<lastName>": "<VlastName>",
  "<email>": "<Vemail>",
  "<password>": "<Vpassword>",
  "<phone>": "<Vphone>",
  "<userStatus>": <VuserStatus>
    }
    """
    And method POST
    Then status 200
    Examples:
      |idcase|id|Vid|username|Vusername|firstName|VfirstName|lastName |VlastName |email          |Vemail         |password  |Vpassword|phone    |Vphone   |userStatus|VuserStatus|
      |case 1|id|05 |username|emcr     |firstName|Enma      |lastName |Obregon   |email          |deoc@gmail.com | password |111aaa.. |phone    |098765431|userStatus|       0   |

@Exercise2
  Scenario Outline: Search user <idcase2>
    Given url 'https://petstore.swagger.io/v2/user/<Vusername>'
    When request
    """
    {
  "<id>": <Vid>,
  "<username>": "<Vusername>",
  "<firstName>": "<VfirstName>",
  "<lastName>": "<VlastName>",
  "<email>": "<Vemail>",
  "<password>": "<Vpassword>",
  "<phone>": "<Vphone>",
  "<userStatus>": <VuserStatus>
    }
    """
    And method GET
    Then status <statuscode>
    Examples:
      |idcase2     |id|Vid|username|Vusername|firstName|VfirstName|lastName |VlastName |email          |Vemail         |password  |Vpassword|phone    |Vphone   |userStatus|VuserStatus|statuscode|
      |successful  |id|05 |username|emcr     |firstName|Enma      |lastName |Obregon   |email          |deoc@gmail.com | password |111aaa.. |phone    |098765431|userStatus|       0   |200       |
      |Not found   |id|32 |username|Estefa   |firstName|Diana     |lastName |Obregon   |email          |deoc@gmail.com | password |111aaa.. |phone    |098765431|userStatus|       0   |404       |
      |Invalid     |id|32 |username|         |firstName|Diana     |lastName |Obregon   |email          |deoc@gmail.com | password |111aaa.. |phone    |098765431|userStatus|       0   |400       |
      |Invalid     |id|32 |username|#$#ana/$ |firstName|Diana     |lastName |Obregon   |email          |deoc@gmail.com | password |111aaa.. |phone    |098765431|userStatus|       0   |400       |

  @Exercise3
  Scenario Outline: Update user <idcase3>
    Given url 'https://petstore.swagger.io/v2/user/<Vusername>'
    When request
    """
    {
  "<id>": <Vid>,
  "<username>": "<Vusername>",
  "<firstName>": "<VfirstName>",
  "<lastName>": "<VlastName>",
  "<email>": "<Vemail>",
  "<password>": "<Vpassword>",
  "<phone>": "<Vphone>",
  "<userStatus>": <VuserStatus>
    }
    """
    And method PUT
    Then status <statuscode>
    Examples:
      |idcase3     |id|Vid|username|Vusername  |firstName|VfirstName|lastName |VlastName |email |Vemail              |password  |Vpassword|phone    |Vphone   |userStatus|VuserStatus|statuscode|
      |successful  |id|05 |username|emcr       |firstName|Diana     |lastName |Obregon   |email |diana2396@gmail.com | password |111aaa.. |phone    |098765431|userStatus|       0   |200       |
      |Not found   |id|32 |username|lgrodriguez|firstName|Diana     |lastName |Obregon   |email |obregon96@gmail.com | password |111aaa.. |phone    |098765431|userStatus|       0   |404       |


  @Exercise4
  Scenario Outline: Search update user  <idcase4>
    Given url 'https://petstore.swagger.io/v2/user/<Vusername>'
    When request
    """
    {
  "<id>": <Vid>,
  "<username>": "<Vusername>",
  "<firstName>": "<VfirstName>",
  "<lastName>": "<VlastName>",
  "<email>": "<Vemail>",
  "<password>": "<Vpassword>",
  "<phone>": "<Vphone>",
  "<userStatus>": <VuserStatus>
    }
    """
    And method GET
    Then status <statuscode>
    Examples:
      |idcase4     |id|Vid|username|Vusername   |firstName|VfirstName|lastName |VlastName |email |Vemail              |password  |Vpassword|phone    |Vphone   |userStatus|VuserStatus|statuscode|
      |successful  |id|05 |username|emcr        |firstName|Enma      |lastName |Obregon   |email |diana2396@gmail.com | password |111aaa.. |phone    |098765431|userStatus|       0   |200       |
      |Not found   |id|32 |username|Lgrodriguez |firstName|Diana     |lastName |Obregon   |email |deoc@gmail.com      | password |111aaa.. |phone    |098765431|userStatus|       0   |404       |

  @Exercise5
  Scenario Outline: Delete  user  <idcase5>
    Given url 'https://petstore.swagger.io/v2/user/<Vusername>'
    When method Delete
    Then status <statuscode>
    Examples:
      |idcase5     |Vusername|statuscode|
      |successful  |emcr     |200       |
      |Not found   |Ariana   |404       |
