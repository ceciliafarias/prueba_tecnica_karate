@signUp
Feature: Sign Up

    Background:
        Given url baseUrl
        And header Content-Type = 'application/json'
        And header Accept = 'application/json'

    @Registrar_un_nuevo_usuario
    Scenario: Sign Up a new user
        Given path 'signup'
        And request { username: "#(userName)", password: "#(userPassword)" }
        When method post
        Then status 200
        And match response == "#string"

    @Registrar_un_usuario_existente
    Scenario: Sign Up a existing user
        Given path 'signup'
        And request { username: "#(userName)", password: "#(userPassword)" }
        When method post
        Then status 200
        And match response.errorMessage == 'This user already exist.'