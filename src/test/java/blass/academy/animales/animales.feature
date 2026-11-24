Feature: Animales

  #Es posible quitar algunos Background por los escenarios reutilizables en helpers
  Background:
    * url baseUrl
    * def animalSchema = read("schemas/animales.json")
    * def animalesSchema = "#[] animalSchema"
  @debug
  Scenario: Obtener todos los animales
    Given path "animales"
    When method GET
    Then status 200
    * match response == animalesSchema

  Scenario: Obtener animal especifico
    Given path "animales", 5
    When method GET
    Then status 200

  Scenario: Eliminar animal especifico
    Given path "animales", 5
    When method DELETE
    Then status 200
    * match response.mensaje == "Animal con id 5 se ha eliminado satisfactoriamente"


  Scenario: Buscar animal por nombre
    * def resultado = karate.call("_obtenerAnimales.feature", {queryParams: {nombre: "Leo"}})

  Scenario: Ordenar animales por peso
    Given path "animales"
    * params {sortBy: "peso", order: "asc" }
    When method GET
    Then status 200

  Scenario: Ordenar animales por tipo
    Given path "animales"
    * params {sortBy: "tipo", order: "cautivo" }
    When method GET
    Then status 200