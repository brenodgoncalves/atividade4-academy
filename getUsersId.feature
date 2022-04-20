Feature:Encontrar um usuário
    Como uma pessoa qualquer
    Desejo consultar os dados de um usuário
    Para visualizar as informações deste usuário

    Background: Criando requisições 
        Given url baseUrl
        And path "users"
        * def hookEsmaga = call read("hook.feature")
        And request hookEsmaga
        * def id = hookEsmaga.response.id

    Scenario:Encontrar um usuário
        And path id
        When method get
        Then status 200
        And match response contains {id: "#present"}
        And match response contains {name: "#present"}
        And match response contains {email: "#present"}
        And match response contains {createdAt: "#present"}
        And match response contains {updatedAt: "#present"}