Feature:Remover um usuário
    Como uma pessoa qualquer
    Desejo remover um usuário
    Para que suas informações não estejam mais registradas

    Background: Url
        Given url baseUrl
        And path "users"
        * def idDelete = "176b812d-4a93-4666-9abe-c4fef2a90f7a"
        
    Scenario:Remover um usuário
        And path idDelete
        When method delete
        Then status 204