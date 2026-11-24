function fn() {
    let env = karate.env; // get system property 'karate.env'
    karate.log('karate.env system property was:', env);
    if (!env) {
        env = 'dev';
    }
    const config = {
        env: env,
        baseUrl: 'https://api.blassacademy.com/bearer/'
    }
    if (env === 'dev') {
        // customize
        // e.g. config.foo = 'bar';
    } else if (env === 'e2e') {
        // customize
    }

    // 1. Obtener el token
    const accessToken = karate.callSingle(
            "classpath:_login.feature",
            {user: "standard_user", pass: "secret_blass_academy"}
        ).accessToken;

    // 2. Asignar el token globalmente
    karate.configure("headers", () => {
            const headers = {"Content-Type": "application/json"};

            // Si NO se ha marcado 'skipAuth' como true, añadimos el token
            if (!karate.get("skipAuth")) {
                headers["Authorization"] = `Bearer ${accessToken}`;
            }

            return headers;
        });

    return config;
}