@login
Feature: Login

    Background:
        Given url baseUrl
        And header Content-Type = 'application/json'
        And header Accept = 'application/json'
        Given path 'login'
        And request { username: "#(userName)", password: "#(userPassword)"}
        When method post
        Then status 200

    @Iniciar_sesión_con_credenciales_correctas
    Scenario: Login with valid credentials
        And match response contains 'Auth_token'

    @Iniciar_sesión_con_credenciales_incorrectas
    Scenario: Login with invalid credentials
        And match response.errorMessage == 'Wrong password.'

    @Iniciar_sesión_con_credenciales_de_usuario_inexistente
    Scenario: Login with non-existent user credentials
        And match response.errorMessage == 'User does not exist.'
    
