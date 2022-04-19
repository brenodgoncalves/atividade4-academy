Feature:Pesquisar usuário
    Como uma pessoa qualquer
    Desejo pesquisar usuário por nome ou e-mail
    Para ser capaz de encontrar um usuário cadastrado facilmente

    Scenario: Pesquisar usuário
        Given url baseUrl
        And path "search"
        When method get
        Then status 200