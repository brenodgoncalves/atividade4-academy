Feature: Hook

    Scenario: Criar usuário
        * def nameAleatorio = Date.now().toString()
        * def emailAleatorio = Date.now().toString()+"@email.com"
        * def emailInvalido = Date.now().toString()+"email.com"
        * def reqPost = read("payloadCriarAleatorio.json")
        Given url baseUrl
        And path "users"
        And request reqPost    
        When method post
        Then status 201