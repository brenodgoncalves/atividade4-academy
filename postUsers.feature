Feature:Criar usuário
    Como uma pessoa qualquer
    Desejo registrar informações de usuário
    Para poder manipular estas informações livremente

    Background: Url
        Given url baseUrl
        And path "users"

    Scenario: Cadatrar usuário
        And request
        """
        {
            "name": "Breno",
            "email": "brnoas@exxample.com.br"
        }
        """
        When method post
        Then status 201
        And match response == "#object"
        And match response contains {name: "#present"}
        And match response contains {email: "#present"}
        