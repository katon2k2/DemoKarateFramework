Feature: kiểm thử api cập nhật thông tin

  Background:
    * def data = read('classpath:common/Data.json')

  Scenario: kiểm tra api cập nhật thông tin thành công
    * def loginResponse = call read('classpath:api/ApiLoginTest.feature')
    * configure headers = { Authorization: '#(loginResponse.token)' }
    Given url data.apiUrl + '/user/update'
    And request data.updateData
    When method PUT
    Then status 200
    And match response.message == "Cập nhật thông tin thành công"