Feature:Encontrar um usuário
    Como uma pessoa qualquer
    Desejo consultar os dados de um usuário
    Para visualizar as informações deste usuário

    Background: Url
        Given url baseUrl
        And path "users"

    Scenario:Encontrar um usuário
        * def idGet = "0016f2e9-c9d4-4aa5-8a59-dda9fc6e5f26"
        And path idGet
        When method get
        Then status 200
        And match response contains {id: "#present"}
        And match response contains {name: "#present"}
        And match response contains {email: "#present"}
        And match response contains {createdAt: "#present"}
        And match response contains {updatedAt: "#present"}

    Scenario:Procurar por usuário nao existente
        * def iddGet = "0016f2e9-c9d4-4aa5-8a59-dda9fc6"
        And path iddGet
        When method get
        Then status 400