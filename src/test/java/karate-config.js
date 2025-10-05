function fn() {
    var config = {
        baseUrl: 'https://api.demoblaze.com/',
        requestTimeout: 10000,
        retry: { count: 3, interval: 1000 },
        headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json'
        },

        report: {
            showLog: true,
            showAllSteps: true
        }
    };
    config.faker = Java.type("com.github.javafaker.Faker");

    karate.log("Config: ", config);
    return config;
}
