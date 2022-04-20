Feature:Atualizar um usuário
    Como uma pessoa qualquer
    Desejo atualizar as informações de determinado usuário
    Para ter o registro de suas informações atualizadas

    Background: Criando requisições
        * def nameAlterado = Date.now().toString()
        * def emailAlterado = Date.now().toString()+"@email.com"
        * def emailAlteradoInvalido = Date.now().toString()+"email.com" 
        * def reqPut = read("updateUsuario.json")
        Given url baseUrl
        And path "users"
        * def hookEsmaga = call read("hook.feature")
        And request hookEsmaga
        * def id = hookEsmaga.response.id
        And path id

    Scenario: Alterar usuário
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
        When method put
        Then status 422

    Scenario: Alterar usuário sem nome
        And request read("updateUsuarioSemNome.json")    
        When method put
        Then status 400
    
    Scenario: Alterar usuário sem email
        And request read("updateUsuarioSemEmail.json")    
        When method put
        Then status 400

    Scenario: Alterar usuário com email inválido
        And request read("updateUsuarioEmailInvalido.json")    
        When method put
        Then status 400

    Scenario: Alterar usuário com nome acima de 100 caracteres
        And request read("updateUsuarioNomeCaracter.json")    
        When method put
        Then status 400   
    
    Scenario: Alterar usuário com email acima de 60 caracteres
        And request read("updateUsuarioEmailCaracter.json")    
        When method put
        Then status 400   