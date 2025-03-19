Feature: kiểm thử api đăng ký

  Background:
    * def data = read('classpath:common/Data.json')

  Scenario: kiểm tra api đăng ký thành công
    Given url data.apiUrl + '/register'
    And request data.registerData
    When method POST
    Then status 201
    And match response.message == "Đăng ký tài khoản thành công"