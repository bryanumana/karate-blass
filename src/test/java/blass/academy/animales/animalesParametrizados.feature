Feature: Animales

  Background:
    * url baseUrl

  @animales
  Scenario Outline: Obtener animal especifico con Examples Table <id>
    * def resultado = karate.call("_obtenerAnimal.feature", {id: <id>})
    * def response = resultado.response
    * match response contains deep
      """
      {
        "id": <id>,
        "nombre": "<nombre>",
        "tipo": "<tipo>",
        "genero": "<genero>",
        "amo": {
          "nombre": "<amoNombre>"
        }
      }
      """
    Examples:
      | id | nombre   | tipo      | genero       | amoNombre  |
      | 1  | Oddie    | salvaje   | hermafrodita | Karen      |
      | 2  | Murphey  | cautivo   | hembra       | Carla      |
      | 3  | Bob      | domestico | macho        | Evelyn     |
      | 4  | Molly    | domestico | hermafrodita | Beatriz    |
      | 5  | Fido     | cautivo   | hermafrodita | Dora       |
      | 6  | Bandido  | cautivo   | hermafrodita | Alfonso    |
      | 7  | Estrella | domestico | hermafrodita | Mollie     |
      | 8  | Oreo     | domestico | hembra       | Christophe |
      | 9  | Teddy    | cautivo   | macho        | Tina       |
      | 10 | Leo      | cautivo   | macho        | Laverne    |

  Scenario Outline: Obtener animal especifico con JSON <id>
    Given path "animales", <id>
    When method GET
    Then status 200
    * match response contains deep
      """
      {
        "id": <id>,
        "nombre": "<nombre>",
        "tipo": "<tipo>",
        "genero": "<genero>",
        "amo": {
          "nombre": "<amoNombre>"
        }
      }
      """
    Examples:
      | read('parametrizado/animales.json') |

  Scenario Outline: Obtener animal especifico con CSV <id>
    Given path "animales", <id>
    When method GET
    Then status 200
    * match response contains deep
      """
      {
        "id": <id>,
        "nombre": "<nombre>",
        "tipo": "<tipo>",
        "genero": "<genero>",
        "amo": {
          "nombre": "<amoNombre>"
        }
      }
      """
    Examples:
      | read('parametrizado/animales.csv') |

