Feature:Pesquisar usuário
    Como uma pessoa qualquer
    Desejo pesquisar usuário por nome ou e-mail
    Para ser capaz de encontrar um usuário cadastrado facilmente

    Background: Criando requisições 
        Given url baseUrl
        And path "search"
        * def hookEsmaga = call read("hook.feature")
        And request hookEsmaga
        * def valueName = hookEsmaga.response.name
        * def valueEmail = hookEsmaga.response.email
    
    Scenario: Pesquisar usuário por nome
        And param value = valueName
        When method get
        Then status 200
        And match response == "#array"
       

    Scenario: Pesquisar usuário por email
        And param value = valueEmail
        When method get
        Then status 200
        And match response == "#array"