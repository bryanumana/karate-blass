Feature: Auth

  Background:
    * url baseUrl
    * def mensajeSchema = read("classpath:mensajeSchema.json")
    * def usuarioLoginSchema = read("schemas/usuarioLoginSchema.json")

  Scenario: Cerrar sesión
    Given path "auth/logout"
    * request read("payloads/logout.json")
    When method POST
    Then status 200
    * match response == mensajeSchema

  Scenario: Cambiar clave
    Given path "auth", "cambiar-clave"
    * request read("payloads/cambiarClave.json")
    When method POST
    Then status 200

  @auth
  Scenario: Ingresar a la sesión
    Given path "auth", "login"
    * request read("payloads/login.json")
    When method POST
    Then status 200
    * match response == usuarioLoginSchema
    * print response.accessToken
    * print response.accessToken.length
    * match response.accessToken.length == 304

  Scenario: Regsitrar
    Given path "auth", "registro"
    * request read("payloads/registro.json")
    When method POST
    Then status 200
    * match response contains deep
      """
      {
        "id": 1,
        "usuario": "standard_user",
        "correo": "standard-user@blass-academy.com",
        "nombre": "Blass",
        "apellido": "Academy",
        "edad": 50
      }
      """