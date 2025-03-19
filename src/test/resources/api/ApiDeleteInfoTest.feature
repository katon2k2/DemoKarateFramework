Feature: kiểm thử api xóa tài khoản

  Background:
    * def data = read('classpath:common/Data.json')

  Scenario: kiểm tra api xóa tài khoản thành công
    * def loginResponse = call read('classpath:api/ApiLoginTest.feature')
    * configure headers = { Authorization: '#(loginResponse.token)' }
    Given url data.apiUrl + '/user/delete'
    When method DELETE
    Then status 200
    And match response.message == "Xóa tài khoản thành công"