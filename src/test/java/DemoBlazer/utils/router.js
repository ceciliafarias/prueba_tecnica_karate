function fn(testCase) {
    let tag = ''
    if (testCase.startsWith('Registrar')) {
        tag = 'signUp.feature@' + testCase.replaceAll(' ', '_')
    } else if (testCase.startsWith('Iniciar')) {
        tag = 'login.feature@' + testCase.replaceAll(' ', '_')
    }
    return tag
}
