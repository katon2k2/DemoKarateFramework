Feature: kiểm thử api đăng nhập

  Background:
    * def data = read('classpath:common/Data.json')

  Scenario: kiểm tra api đăng nhập thành công
    Given url data.apiUrl + '/login'
    And request data.loginData
    When method POST
    Then status 200
    And match response.message == "Đăng nhập thành công!"
    * def token = response.token