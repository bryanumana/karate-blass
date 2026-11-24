Feature: Login
  Background:
    * url 'https://api.blassacademy.com/bearer'

  @ignore
  Scenario:
    Given path "auth", "login"
    * request {username: '#(user)', password: '#(pass)'}
    When method POST
    Then status 200
    * def accessToken = response.accessToken