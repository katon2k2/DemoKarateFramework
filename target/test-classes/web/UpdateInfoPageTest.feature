Feature: kiểm thử trang cập nhật thông tin

  Background:
    * configure driver = { type: 'chromedriver', pollingInterval: 2000, headless: true }
    * def data = read('classpath:common/Data.json')
    * def locators = read('classpath:common/Locators.json')

  Scenario: kiểm tra hiển thị trang cập nhật thông tin
    * call read('classpath:web/LoginPageTest.feature@LoginSuccess')
    And click(locators.showInfoPage.ButtonUpdate)
    And clear(locators.updateInfoPage.InputUserName)
    And input(locators.updateInfoPage.InputUserName, data.updateData.InputUserName)
    Then match value(locators.updateInfoPage.InputUserName) == data.updateData.InputUserName

  Scenario: kiểm tra bỏ trống họ tên
    * call read('classpath:web/LoginPageTest.feature@LoginSuccess')
    And click(locators.showInfoPage.ButtonUpdate)
    And clear(locators.updateInfoPage.InputUserName)
    And click(locators.updateInfoPage.ButtonSave)
    And click(locators.updateInfoPage.ButtonAgree)
    Then waitFor(locators.updateInfoPage.NotiInvalidUserName)

  Scenario: kiểm tra bỏ trống số điện thoại
    * call read('classpath:web/LoginPageTest.feature@LoginSuccess')
    And click(locators.showInfoPage.ButtonUpdate)
    And clear(locators.updateInfoPage.InputUserPhone)
    And click(locators.updateInfoPage.ButtonSave)
    And click(locators.updateInfoPage.ButtonAgree)
    Then waitFor(locators.updateInfoPage.NotiInvalidUserPhone)

  Scenario: kiểm tra bỏ trống email
    * call read('classpath:web/LoginPageTest.feature@LoginSuccess')
    And click(locators.showInfoPage.ButtonUpdate)
    And clear(locators.updateInfoPage.InputUserEmail)
    And click(locators.updateInfoPage.ButtonSave)
    And click(locators.updateInfoPage.ButtonAgree)
    Then waitFor(locators.updateInfoPage.NotiInvalidUserEmail)

  Scenario: kiểm tra nhập họ tên > 50 ký tự
    * call read('classpath:web/LoginPageTest.feature@LoginSuccess')
    And click(locators.showInfoPage.ButtonUpdate)
    And clear(locators.updateInfoPage.InputUserName)
    And input(locators.updateInfoPage.InputUserName, data.invalidData.InputUserNameOverLength)
    And click(locators.updateInfoPage.ButtonSave)
    And click(locators.updateInfoPage.ButtonAgree)
    Then waitFor(locators.updateInfoPage.NotiInvalidUserName)

  Scenario: kiểm tra nhập họ tên chứa chữ số
    * call read('classpath:web/LoginPageTest.feature@LoginSuccess')
    And click(locators.showInfoPage.ButtonUpdate)
    And clear(locators.updateInfoPage.InputUserName)
    And input(locators.updateInfoPage.InputUserName, data.invalidData.InputUserNameWithNumber)
    And click(locators.updateInfoPage.ButtonSave)
    And click(locators.updateInfoPage.ButtonAgree)
    Then waitFor(locators.updateInfoPage.NotiInvalidUserName)

  Scenario: kiểm tra nhập họ tên chứa ký tự đặc biệt
    * call read('classpath:web/LoginPageTest.feature@LoginSuccess')
    And click(locators.showInfoPage.ButtonUpdate)
    And clear(locators.updateInfoPage.InputUserName)
    And input(locators.updateInfoPage.InputUserName, data.invalidData.InputUserNameWithSpecialCharacters)
    And click(locators.updateInfoPage.ButtonSave)
    And click(locators.updateInfoPage.ButtonAgree)
    Then waitFor(locators.updateInfoPage.NotiInvalidUserName)

  Scenario: kiểm tra nhập họ tên chỉ chứa khoảng trắng
    * call read('classpath:web/LoginPageTest.feature@LoginSuccess')
    And click(locators.showInfoPage.ButtonUpdate)
    And clear(locators.updateInfoPage.InputUserName)
    And input(locators.updateInfoPage.InputUserName, data.invalidData.InputUserNameOnlySpace)
    And click(locators.updateInfoPage.ButtonSave)
    And click(locators.updateInfoPage.ButtonAgree)
    Then waitFor(locators.updateInfoPage.NotiInvalidUserName)

  Scenario: kiểm tra nhập số điện thoại > 10 ký tự
    * call read('classpath:web/LoginPageTest.feature@LoginSuccess')
    And click(locators.showInfoPage.ButtonUpdate)
    And clear(locators.updateInfoPage.InputUserPhone)
    And input(locators.updateInfoPage.InputUserPhone, data.invalidData.InputUserPhoneOverLength)
    And click(locators.updateInfoPage.ButtonSave)
    And click(locators.updateInfoPage.ButtonAgree)
    Then waitFor(locators.updateInfoPage.NotiInvalidUserPhone)

  Scenario: kiểm tra nhập số điện thoại < 10 ký tự
    * call read('classpath:web/LoginPageTest.feature@LoginSuccess')
    And click(locators.showInfoPage.ButtonUpdate)
    And clear(locators.updateInfoPage.InputUserPhone)
    And input(locators.updateInfoPage.InputUserPhone, data.invalidData.InputUserPhoneTooShort)
    And click(locators.updateInfoPage.ButtonSave)
    And click(locators.updateInfoPage.ButtonAgree)
    Then waitFor(locators.updateInfoPage.NotiInvalidUserPhone)

  Scenario: kiểm tra nhập số điện thoại chứa chữ cái
    * call read('classpath:web/LoginPageTest.feature@LoginSuccess')
    And click(locators.showInfoPage.ButtonUpdate)
    And clear(locators.updateInfoPage.InputUserPhone)
    And input(locators.updateInfoPage.InputUserPhone, data.invalidData.InputUserPhoneWithAlphabet)
    And click(locators.updateInfoPage.ButtonSave)
    And click(locators.updateInfoPage.ButtonAgree)
    Then waitFor(locators.updateInfoPage.NotiInvalidUserPhone)

  Scenario: kiểm tra nhập số điện thoại chứa ký tự đặc biệt
    * call read('classpath:web/LoginPageTest.feature@LoginSuccess')
    And click(locators.showInfoPage.ButtonUpdate)
    And clear(locators.updateInfoPage.InputUserPhone)
    And input(locators.updateInfoPage.InputUserPhone, data.invalidData.InputUserPhoneWithSpecialCharacters)
    And click(locators.updateInfoPage.ButtonSave)
    And click(locators.updateInfoPage.ButtonAgree)
    Then waitFor(locators.updateInfoPage.NotiInvalidUserPhone)

  Scenario: kiểm tra nhập số điện thoại chỉ chứa khoảng trắng
    * call read('classpath:web/LoginPageTest.feature@LoginSuccess')
    And click(locators.showInfoPage.ButtonUpdate)
    And clear(locators.updateInfoPage.InputUserPhone)
    And input(locators.updateInfoPage.InputUserPhone, data.invalidData.InputUserPhoneOnlySpace)
    And click(locators.updateInfoPage.ButtonSave)
    And click(locators.updateInfoPage.ButtonAgree)
    Then waitFor(locators.updateInfoPage.NotiInvalidUserPhone)

  Scenario: kiểm tra nhập email > 255 ký tự
    * call read('classpath:web/LoginPageTest.feature@LoginSuccess')
    And click(locators.showInfoPage.ButtonUpdate)
    And clear(locators.updateInfoPage.InputUserEmail)
    And input(locators.updateInfoPage.InputUserEmail, data.invalidData.InputUserEmailOverLength)
    And click(locators.updateInfoPage.ButtonSave)
    And click(locators.updateInfoPage.ButtonAgree)
    Then waitFor(locators.updateInfoPage.NotiInvalidUserEmail)

  Scenario: kiểm tra nhập email chứa ký tự đặc biệt
    * call read('classpath:web/LoginPageTest.feature@LoginSuccess')
    And click(locators.showInfoPage.ButtonUpdate)
    And clear(locators.updateInfoPage.InputUserEmail)
    And input(locators.updateInfoPage.InputUserEmail, data.invalidData.InputUserEmailWithSpecialCharacters)
    And click(locators.updateInfoPage.ButtonSave)
    And click(locators.updateInfoPage.ButtonAgree)
    Then waitFor(locators.updateInfoPage.NotiInvalidUserEmail)

  Scenario: kiểm tra nhập email với đuôi không phải @gmail.com
    * call read('classpath:web/LoginPageTest.feature@LoginSuccess')
    And click(locators.showInfoPage.ButtonUpdate)
    And clear(locators.updateInfoPage.InputUserEmail)
    And input(locators.updateInfoPage.InputUserEmail, data.invalidData.InputUserEmailIncorrectExtension)
    And click(locators.updateInfoPage.ButtonSave)
    And click(locators.updateInfoPage.ButtonAgree)
    Then waitFor(locators.updateInfoPage.NotiInvalidUserEmail)

    Scenario: kiểm tra nhập email với đầu chỉ chứa khoảng trắng
    * call read('classpath:web/LoginPageTest.feature@LoginSuccess')
    And click(locators.showInfoPage.ButtonUpdate)
    And clear(locators.updateInfoPage.InputUserEmail)
    And input(locators.updateInfoPage.InputUserEmail, data.invalidData.InputUserEmailHeaderIsSpace)
    And click(locators.updateInfoPage.ButtonSave)
    And click(locators.updateInfoPage.ButtonAgree)
    Then waitFor(locators.updateInfoPage.NotiInvalidUserEmail)

    Scenario: kiểm tra bấm nút mũi tên trở về
    * call read('classpath:web/LoginPageTest.feature@LoginSuccess')
    And click(locators.showInfoPage.ButtonUpdate)
    And click(locators.updateInfoPage.ButtonBack)
    And input(locators.showInfoPage.InputUserAccount, data.invalidData.InputUserAccountOverLength)
    Then match value(locators.showInfoPage.InputUserAccount) == data.loginData.InputUserAccount

    Scenario: kiểm tra bấm nút đăng xuất
    * call read('classpath:web/LoginPageTest.feature@LoginSuccess')
    And click(locators.showInfoPage.ButtonUpdate)
    And click(locators.updateInfoPage.ButtonLogout)
    Then waitFor(locators.loginPage.Title)

  @UpdateInfoSuccess
  Scenario: kiểm tra cập nhật thông tin thành công
    * call read('classpath:web/LoginPageTest.feature@LoginSuccess')
    And click(locators.showInfoPage.ButtonUpdate)
    And clear(locators.updateInfoPage.InputUserName)
    And input(locators.updateInfoPage.InputUserName, data.updateData.InputUserName)
    And clear(locators.updateInfoPage.InputUserPhone)
    And input(locators.updateInfoPage.InputUserPhone, data.updateData.InputUserPhone)
    And clear(locators.updateInfoPage.InputUserEmail)
    And input(locators.updateInfoPage.InputUserEmail, data.updateData.InputUserEmail)
    And click(locators.updateInfoPage.ButtonSave)
    And click(locators.updateInfoPage.ButtonAgree)
    Then waitFor(locators.showInfoPage.NotiUpdateSuccess)