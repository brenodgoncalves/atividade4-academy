Feature:Remover um usuário
    Como uma pessoa qualquer
    Desejo remover um usuário
    Para que suas informações não estejam mais registradas

    Scenario:Remover um usuário
        Given url baseUrl
        And path "users","f2bf4208-c438-47be-8523-2d9a10995b30"
        When method delete
        Then status 204