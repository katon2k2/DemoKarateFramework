Feature: kiểm thử api hiển thị thông tin

  Background:
    * def data = read('classpath:common/DataApi.json')

  Scenario: kiểm tra api hiển thị thông tin thành công
    * def loginResponse = call read('classpath:api/ApiLoginTest.feature')
    * configure headers = { Authorization: '#(loginResponse.token)' }
    Given url data.apiUrl + '/user/show'
    When method GET
    Then status 200
    And match response.message == "Thông tin tài khoản"