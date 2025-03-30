Feature: kiểm thử api xóa tài khoản

  Background:
    * def data = read('classpath:common/DataApi.json')

  Scenario: kiểm tra api xóa tài khoản thành công
    * def loginResponse = call read('classpath:api/ApiLoginTest.feature')
    * configure headers = { Authorization: '#(loginResponse.token)' }
    Given url data.apiUrl + '/user/delete'
    When method DELETE
    Then status 200
    And match response.message == "Xóa tài khoản thành công"
    * def resultQuery = Java.type('MySqlResultQuery')
    * def query = "SELECT id FROM users WHERE account = '"+data.registerData.InputUserAccount+"'"
    * def result = resultQuery.getQueryResult(data.mySqlData.Url, data.mySqlData.Account, data.mySqlData.Password, query)
    And match result == []