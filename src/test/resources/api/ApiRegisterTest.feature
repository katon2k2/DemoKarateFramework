Feature: kiểm thử api đăng ký

  Background:
    * def data = read('classpath:common/DataApi.json')

  Scenario: kiểm tra api đăng ký thành công
    Given url data.apiUrl + '/register'
    And request data.registerData
    When method POST
    Then status 201
    And match response.message == "Đăng ký tài khoản thành công"
    * def resultQuery = Java.type('MySqlResultQuery')
    * def query = "SELECT id FROM users WHERE name = '"+data.registerData.InputUserName+"' AND phone = '"+data.registerData.InputUserPhone+"' AND email = '"+data.registerData.InputUserEmail+"' AND account = '"+data.registerData.InputUserAccount+"'"
    * def result = resultQuery.getQueryResult(data.mySqlData.Url, data.mySqlData.Account, data.mySqlData.Password, query)
    And match result != []