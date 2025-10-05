Feature: DemoBlaze

    Background:
        * def demoBlazePath = 'classpath:DemoBlazer/'
        * def router = read(demoBlazePath + 'utils/router.js')
        * call read(demoBlazePath + 'utils/initData.feature')
        * def featurePath = demoBlazePath + 'features/'

    @demoBlazeCsv
    Scenario Outline: <testCode> - <testName>
        * def feature = router(testName)
        * def scenarioPath = featurePath + feature
        * call read(scenarioPath)
        Examples:
            | read('../resources/inputData.csv') |

    @demoBlazeJson
    Scenario Outline: <testCode> - <testName>
        * def feature = router(testName)
        * def scenarioPath = featurePath + feature
        * call read(scenarioPath)
        Examples:
            | read('../resources/inputData.json') |

    @demoBlazeE2E
    Scenario: E2E
        * def signUp = karate.call(featurePath + 'signup.feature@Registrar_un_nuevo_usuario', { userName: userName, userPassword: userPassword }).response
        * match signUp == '#string'
        * def login = karate.call(featurePath + 'login.feature@Iniciar_sesión_con_credenciales_correctas', { userName: userName, userPassword: userPassword }).response
        * match login contains 'Auth_token'