Feature:Remover um usuário
    Como uma pessoa qualquer
    Desejo remover um usuário
    Para que suas informações não estejam mais registradas

    Scenario: Deletar usuário 
        * def hookEsmaga = call read("hook.feature")
        And request hookEsmaga
        * def id = hookEsmaga.response.id
        Given url baseUrl
        And path "users"
        And path id
        When method delete
        Then status 204