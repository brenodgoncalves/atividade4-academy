Feature: Listar usuários
    Como uma pessoa qualquer
    Desejo consultar todos os usuários cadastrados
    Para ter as informações de todos os usuários


    Scenario: Listar todos os usuários
        Given url baseUrl
        And path "users"
        When method get
        Then status 200
        And match response == "#array"
        And match response[*].id == "#present"
        And match response[*].name == "#present"
        And match response[*].email == "#present"
        And match response[*].createdAt == "#present"
        And match response[*].updatedAt == "#present"
        