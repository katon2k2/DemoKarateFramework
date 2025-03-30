Feature: kiểm thử trang đăng nhập

  Background:
    * configure driver = { type: 'chromedriver', pollingInterval: 2000, addOptions: ['--start-maximized'] }
    * def data = read('classpath:common/DataWeb.json')
    * def locators = read('classpath:common/Locators.json')

  Scenario: kiểm tra hiển thị trang đăng nhập
    Given driver data.loginUrl
    Then waitFor(locators.loginPage.Title)

  Scenario: kiểm tra bỏ trống tài khoản
    Given driver data.loginUrl
    And input(locators.loginPage.InputUserPassword, data.loginData.InputUserPassword)
    And click(locators.loginPage.ButtonLogin)
    Then waitFor(locators.loginPage.NotiEmptyInput)

  Scenario: kiểm tra bỏ trống mật khẩu
    Given driver data.loginUrl
    And input(locators.loginPage.InputUserAccount, data.loginData.InputUserAccount)
    And click(locators.loginPage.ButtonLogin)
    Then waitFor(locators.loginPage.NotiEmptyInput)

  Scenario: kiểm tra nhập sai tài khoản
    Given driver data.loginUrl
    And input(locators.loginPage.InputUserAccount, data.invalidData.InputUserAccountWrong)
    And input(locators.loginPage.InputUserPassword, data.loginData.InputUserPassword)
    And click(locators.loginPage.ButtonLogin)
    Then waitFor(locators.loginPage.NotiWrongAccount)

  Scenario: kiểm tra nhập sai mật khẩu
    Given driver data.loginUrl
    And input(locators.loginPage.InputUserAccount, data.loginData.InputUserAccount)
    And input(locators.loginPage.InputUserPassword, data.invalidData.InputUserPasswordWrong)
    And click(locators.loginPage.ButtonLogin)
    Then waitFor(locators.loginPage.NotiWrongAccount)

  Scenario: kiểm tra bấm nút đăng ký
    Given driver data.loginUrl
    And click(locators.loginPage.ButtonRegister)
    Then waitFor(locators.registerPage.Title)

  @LoginSuccess
  Scenario: kiểm tra đăng nhập thành công
    Given driver data.loginUrl
    And input(locators.loginPage.InputUserAccount, data.loginData.InputUserAccount)
    And input(locators.loginPage.InputUserPassword, data.loginData.InputUserPassword)
    And click(locators.loginPage.ButtonLogin)
    Then waitFor(locators.showInfoPage.Title)
    And match value(locators.showInfoPage.InputUserAccount) == data.loginData.InputUserAccount