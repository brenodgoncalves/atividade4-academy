Feature:Criar usuário
    Como uma pessoa qualquer
    Desejo registrar informações de usuário
    Para poder manipular estas informações livremente

    Background: Criando requisições 
        * def nameAleatorio = Date.now().toString()
        * def emailAleatorio = Date.now().toString()+"@email.com"
        * def emailInvalido = Date.now().toString()+"email.com"
        * def reqPost = read("payloadCriarAleatorio.json")
        Given url baseUrl
        And path "users"

    Scenario: Cadastrar usuário        
        And request reqPost    
        When method post
        Then status 201
        And match response == "#object"
        And match response contains reqPost
        And match response contains {id: "#present"}
        And match response contains {name: "#present"}
        And match response contains {email: "#present"}
        And match response contains {createdAt: "#present"}
        And match response contains {updatedAt: "#present"}

    Scenario: Cadastrar usuário existente
        And request read("payloadCriarUsuario.json")    
        When method post
        Then status 422
    
    Scenario: Cadastrar usuário sem nome
        And request read("payloadUsuarioSemNome.json")    
        When method post
        Then status 400
    
    Scenario: Cadastrar usuário sem email
        And request read("payloadUsuarioSemEmail.json")    
        When method post
        Then status 400

    Scenario: Cadastrar usuário com email inválido
        And request read("payloadUsuarioEmailInvalido.json")    
        When method post
        Then status 400

    Scenario: Cadastrar usuário com nome acima de 100 caracteres
        And request read("payloadUsuarioNomeCaracter.json")    
        When method post
        Then status 400   
    
    Scenario: Cadastrar usuário com email acima de 60 caracteres
        And request read("payloadUsuarioEmailCaracter.json")    
        When method post
        Then status 400   
