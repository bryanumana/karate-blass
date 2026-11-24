Feature: Estado

  Background:
    * url baseUrl

  # @debug
  Scenario: Estado
    Given path "estado"
    When method GET
    Then status 200