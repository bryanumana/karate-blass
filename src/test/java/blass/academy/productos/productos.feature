Feature: Productos

  Background:
    * url baseUrl
    * def criticasSchema = read("schemas/criticaSchema.json")
    * def productosSchema = read("schemas/productosSchema.json")

  Scenario: Obtener todos los animales
    Given path "productos"
    When method GET
    Then status 200

  @productos
  Scenario: Obtener producto especifico
    Given path "productos", 2
    When method GET
    Then status 200
    * match response == productosSchema
    * match response.etiquetas.length == 7
    * match response.etiquetas contains ["Antojos", "Fresco"]

  Scenario: Eliminar producto especifico
    Given path "productos", 2
    When method DELETE
    Then status 200