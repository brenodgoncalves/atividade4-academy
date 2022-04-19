Feature:Atualizar um usuário
    Como uma pessoa qualquer
    Desejo atualizar as informações de determinado usuário
    Para ter o registro de suas informações atualizadas

    Scenario: Cadatrar usuário
        Given url baseUrl
        And path "users","0016f2e9-c9d4-4aa5-8a59-dda9fc6e5f26"
        And request
        """
        {
            "name": "Breno Teste 3 alterado",
            "email": "breno@example.com.br"
        }
        """
        When method put
        Then status 200
        And match response contains {name: "Breno"}