Feature: kiểm thử trang hiển thị thông tin

  Background:
    * configure driver = { type: 'chromedriver', pollingInterval: 2000, addOptions: ['--start-maximized'] }
    * def data = read('classpath:common/DataWeb.json')
    * def locators = read('classpath:common/Locators.json')


  Scenario: kiểm tra hiển thị trang hiển thị thông tin
    * call read('classpath:web/LoginPageTest.feature@LoginSuccess')
    Then waitFor(locators.showInfoPage.Title)

  Scenario: kiểm tra bấm nút cập nhật
    * call read('classpath:web/LoginPageTest.feature@LoginSuccess')
    And click(locators.showInfoPage.ButtonUpdate)
    And clear(locators.updateInfoPage.InputUserName)
    And input(locators.updateInfoPage.InputUserName, data.updateData.InputUserName)
    Then match value(locators.updateInfoPage.InputUserName) == data.updateData.InputUserName

  Scenario: kiểm tra bấm nút đăng xuất
    * call read('classpath:web/LoginPageTest.feature@LoginSuccess')
    And click(locators.showInfoPage.ButtonLogout)
    Then waitFor(locators.loginPage.Title)