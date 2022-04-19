Feature:Pesquisar usuário
    Como uma pessoa qualquer
    Desejo pesquisar usuário por nome ou e-mail
    Para ser capaz de encontrar um usuário cadastrado facilmente

    Background: Url
        Given url baseUrl
        And path "search"
    
    Scenario: Pesquisar usuário por nome
        And param value = "Breno D Goncalves"
        When method get
        Then status 200
        And match response == "#array"
       

    Scenario: Pesquisar usuário por email
        And param value = "brenodgoncalves@example.gov.br"
        When method get
        Then status 200
        And match response == "#array"