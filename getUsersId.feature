Feature:Encontrar um usuário
    Como uma pessoa qualquer
    Desejo consultar os dados de um usuário
    Para visualizar as informações deste usuário

    Scenario:Encontrar um usuário
        Given url baseUrl
        And path "users","d67936d7-13ab-4bda-85ba-8cdc0e36ba41"
        When method get
        Then status 200
        And match response contains {name: "#present"}