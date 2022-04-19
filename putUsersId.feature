Feature:Atualizar um usuário
    Como uma pessoa qualquer
    Desejo atualizar as informações de determinado usuário
    Para ter o registro de suas informações atualizadas

    Background: Url
        Given url baseUrl
        And path "users"
        * def idPut = "0016f2e9-c9d4-4aa5-8a59-dda9fc6e5f26"
            
    Scenario: Alterar usuário
        * def reqPut = read("updateUsuario.json")
        And path idPut
        And request reqPut
        When method put
        Then status 200
        And match response contains reqPut
        And match response contains {id: "#present"}
        And match response contains {name: "#present"}
        And match response contains {email: "#present"}
        And match response contains {createdAt: "#present"}
        And match response contains {updatedAt: "#present"}

    Scenario: Alterar usuário com dados iguais a um existente
        And request read("updateUsuarioIgual.json")    
        When method post
        Then status 422

    Scenario: Alterar usuário sem nome
        And request read("updateUsuarioSemNome.json")    
        When method post
        Then status 400
    
    Scenario: Alterar usuário sem email
        And request read("updateUsuarioSemEmail.json")    
        When method post
        Then status 400

    Scenario: Alterar usuário com email inválido
        And request read("updateUsuarioEmailInvalido.json")    
        When method post
        Then status 400

    Scenario: Alterar usuário com nome acima de 100 caracteres
        And request read("updateUsuarioNomeCaracter.json")    
        When method post
        Then status 400   
    
    Scenario: Alterar usuário com email acima de 60 caracteres
        And request read("updateUsuarioEmailCaracter.json")    
        When method post
        Then status 400   