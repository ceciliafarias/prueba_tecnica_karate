@ignore
Feature: initData

    Scenario: Init data
        * def fakerObj = new faker()
        * def userName = karate.get('userName', '') ? karate.get('userName') : fakerObj.name().username()
        * def userPassword = karate.get('userPassword', '') ? karate.get('userPassword') : fakerObj.internet().password()
