Feature: Obtener Animales Reutilizable

  Background:
    * url baseUrl

  @ignore
  Scenario: Obtener todos los animales
    Given path "animales"
    * params queryParams
    When method GET
    Then status 200