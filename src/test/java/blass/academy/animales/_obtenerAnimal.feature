Feature: Obtener Animal Reutilizable

  Background:
    * url baseUrl
    * def animalSchema = read("schemas/animales.json")

  @ignore
  Scenario: Obtener todos los animales
    Given path "animales", id
    When method GET
    Then status 200
    * match response == animalSchema