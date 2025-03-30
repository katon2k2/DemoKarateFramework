Feature: kiểm thử trang đăng ký

  Background:
    * configure driver = { type: 'chromedriver', pollingInterval: 2000, addOptions: ['--start-maximized']  }
    * def data = read('classpath:common/DataWeb.json')
    * def locators = read('classpath:common/Locators.json')

  Scenario: kiểm tra hiển thị trang đăng ký
    Given driver data.registerUrl
    Then waitFor(locators.registerPage.Title)

  Scenario: kiểm tra bỏ trống họ tên
    Given driver data.registerUrl
    And input(locators.registerPage.InputUserPhone, data.registerData.InputUserPhone)
    And input(locators.registerPage.InputUserEmail, data.registerData.InputUserEmail)
    And input(locators.registerPage.InputUserAccount, data.registerData.InputUserAccount)
    And input(locators.registerPage.InputUserPassword, data.registerData.InputUserPassword)
    And input(locators.registerPage.InputUserConfirmPassword, data.registerData.InputUserPassword)
    And click(locators.registerPage.ButtonRegister)
    Then waitFor(locators.registerPage.NotiInvalidUserName)

  Scenario: kiểm tra bỏ trống số điện thoại
    Given driver data.registerUrl
    And input(locators.registerPage.InputUserName, data.registerData.InputUserName)
    And input(locators.registerPage.InputUserEmail, data.registerData.InputUserEmail)
    And input(locators.registerPage.InputUserAccount, data.registerData.InputUserAccount)
    And input(locators.registerPage.InputUserPassword, data.registerData.InputUserPassword)
    And input(locators.registerPage.InputUserConfirmPassword, data.registerData.InputUserPassword)
    And click(locators.registerPage.ButtonRegister)
    Then waitFor(locators.registerPage.NotiInvalidUserPhone)

  Scenario: kiểm tra bỏ trống email
    Given driver data.registerUrl
    And input(locators.registerPage.InputUserName, data.registerData.InputUserName)
    And input(locators.registerPage.InputUserPhone, data.registerData.InputUserPhone)
    And input(locators.registerPage.InputUserAccount, data.registerData.InputUserAccount)
    And input(locators.registerPage.InputUserPassword, data.registerData.InputUserPassword)
    And input(locators.registerPage.InputUserConfirmPassword, data.registerData.InputUserPassword)
    And click(locators.registerPage.ButtonRegister)
    Then waitFor(locators.registerPage.NotiInvalidUserEmail)

  Scenario: kiểm tra bỏ trống tên đăng nhập
    Given driver data.registerUrl
    And input(locators.registerPage.InputUserName, data.registerData.InputUserName)
    And input(locators.registerPage.InputUserPhone, data.registerData.InputUserPhone)
    And input(locators.registerPage.InputUserEmail, data.registerData.InputUserEmail)
    And input(locators.registerPage.InputUserPassword, data.registerData.InputUserPassword)
    And input(locators.registerPage.InputUserConfirmPassword, data.registerData.InputUserPassword)
    And click(locators.registerPage.ButtonRegister)
    Then waitFor(locators.registerPage.NotiInvalidAccount)

  Scenario: kiểm tra bỏ trống mật khẩu
    Given driver data.registerUrl
    And input(locators.registerPage.InputUserName, data.registerData.InputUserName)
    And input(locators.registerPage.InputUserPhone, data.registerData.InputUserPhone)
    And input(locators.registerPage.InputUserEmail, data.registerData.InputUserEmail)
    And input(locators.registerPage.InputUserAccount, data.registerData.InputUserAccount)
    And input(locators.registerPage.InputUserConfirmPassword, data.registerData.InputUserPassword)
    And click(locators.registerPage.ButtonRegister)
    Then waitFor(locators.registerPage.NotiInvalidPassword)

  Scenario: kiểm tra bỏ trống nhập lại mật khẩu
    Given driver data.registerUrl
    And input(locators.registerPage.InputUserName, data.registerData.InputUserName)
    And input(locators.registerPage.InputUserPhone, data.registerData.InputUserPhone)
    And input(locators.registerPage.InputUserEmail, data.registerData.InputUserEmail)
    And input(locators.registerPage.InputUserAccount, data.registerData.InputUserAccount)
    And input(locators.registerPage.InputUserPassword, data.registerData.InputUserPassword)
    And click(locators.registerPage.ButtonRegister)
    Then waitFor(locators.registerPage.NotiInvalidConfirmPassword)

  Scenario: kiểm tra nhập họ tên > 50 ký tự
    Given driver data.registerUrl
    And input(locators.registerPage.InputUserName, data.invalidData.InputUserNameOverLength)
    And input(locators.registerPage.InputUserPhone, data.registerData.InputUserPhone)
    And input(locators.registerPage.InputUserEmail, data.registerData.InputUserEmail)
    And input(locators.registerPage.InputUserAccount, data.registerData.InputUserAccount)
    And input(locators.registerPage.InputUserPassword, data.registerData.InputUserPassword)
    And input(locators.registerPage.InputUserConfirmPassword, data.registerData.InputUserPassword)
    And click(locators.registerPage.ButtonRegister)
    Then waitFor(locators.registerPage.NotiInvalidUserName)

  Scenario: kiểm tra nhập họ tên chứa chữ số
    Given driver data.registerUrl
    And input(locators.registerPage.InputUserName, data.invalidData.InputUserNameWithNumber)
    And input(locators.registerPage.InputUserPhone, data.registerData.InputUserPhone)
    And input(locators.registerPage.InputUserEmail, data.registerData.InputUserEmail)
    And input(locators.registerPage.InputUserAccount, data.registerData.InputUserAccount)
    And input(locators.registerPage.InputUserPassword, data.registerData.InputUserPassword)
    And input(locators.registerPage.InputUserConfirmPassword, data.registerData.InputUserPassword)
    And click(locators.registerPage.ButtonRegister)
    Then waitFor(locators.registerPage.NotiInvalidUserName)

  Scenario: kiểm tra nhập họ tên chứa ký tự đặc biệt
    Given driver data.registerUrl
    And input(locators.registerPage.InputUserName, data.invalidData.InputUserNameWithSpecialCharacters)
    And input(locators.registerPage.InputUserPhone, data.registerData.InputUserPhone)
    And input(locators.registerPage.InputUserEmail, data.registerData.InputUserEmail)
    And input(locators.registerPage.InputUserAccount, data.registerData.InputUserAccount)
    And input(locators.registerPage.InputUserPassword, data.registerData.InputUserPassword)
    And input(locators.registerPage.InputUserConfirmPassword, data.registerData.InputUserPassword)
    And click(locators.registerPage.ButtonRegister)
    Then waitFor(locators.registerPage.NotiInvalidUserName)

  Scenario: kiểm tra nhập họ tên chỉ chứa khoảng trắng
    Given driver data.registerUrl
    And input(locators.registerPage.InputUserName, data.invalidData.InputUserNameOnlySpace)
    And input(locators.registerPage.InputUserPhone, data.registerData.InputUserPhone)
    And input(locators.registerPage.InputUserEmail, data.registerData.InputUserEmail)
    And input(locators.registerPage.InputUserAccount, data.registerData.InputUserAccount)
    And input(locators.registerPage.InputUserPassword, data.registerData.InputUserPassword)
    And input(locators.registerPage.InputUserConfirmPassword, data.registerData.InputUserPassword)
    And click(locators.registerPage.ButtonRegister)
    Then waitFor(locators.registerPage.NotiInvalidUserName)

  Scenario: kiểm tra nhập số điện thoại > 10 ký tự
    Given driver data.registerUrl
    And input(locators.registerPage.InputUserName, data.registerData.InputUserName)
    And input(locators.registerPage.InputUserPhone, data.invalidData.InputUserPhoneOverLength)
    And input(locators.registerPage.InputUserEmail, data.registerData.InputUserEmail)
    And input(locators.registerPage.InputUserAccount, data.registerData.InputUserAccount)
    And input(locators.registerPage.InputUserPassword, data.registerData.InputUserPassword)
    And input(locators.registerPage.InputUserConfirmPassword, data.registerData.InputUserPassword)
    And click(locators.registerPage.ButtonRegister)
    Then waitFor(locators.registerPage.NotiInvalidUserPhone)

  Scenario: kiểm tra nhập số điện thoại < 10 ký tự
    Given driver data.registerUrl
    And input(locators.registerPage.InputUserName, data.registerData.InputUserName)
    And input(locators.registerPage.InputUserPhone, data.invalidData.InputUserPhoneTooShort)
    And input(locators.registerPage.InputUserEmail, data.registerData.InputUserEmail)
    And input(locators.registerPage.InputUserAccount, data.registerData.InputUserAccount)
    And input(locators.registerPage.InputUserPassword, data.registerData.InputUserPassword)
    And input(locators.registerPage.InputUserConfirmPassword, data.registerData.InputUserPassword)
    And click(locators.registerPage.ButtonRegister)
    Then waitFor(locators.registerPage.NotiInvalidUserPhone)

  Scenario: kiểm tra nhập số điện thoại chứa chữ cái
    Given driver data.registerUrl
    And input(locators.registerPage.InputUserName, data.registerData.InputUserName)
    And input(locators.registerPage.InputUserPhone, data.invalidData.InputUserPhoneWithAlphabet)
    And input(locators.registerPage.InputUserEmail, data.registerData.InputUserEmail)
    And input(locators.registerPage.InputUserAccount, data.registerData.InputUserAccount)
    And input(locators.registerPage.InputUserPassword, data.registerData.InputUserPassword)
    And input(locators.registerPage.InputUserConfirmPassword, data.registerData.InputUserPassword)
    And click(locators.registerPage.ButtonRegister)
    Then waitFor(locators.registerPage.NotiInvalidUserPhone)

  Scenario: kiểm tra nhập số điện thoại chứa ký tự đặc biệt
    Given driver data.registerUrl
    And input(locators.registerPage.InputUserName, data.registerData.InputUserName)
    And input(locators.registerPage.InputUserPhone, data.invalidData.InputUserPhoneWithSpecialCharacters)
    And input(locators.registerPage.InputUserEmail, data.registerData.InputUserEmail)
    And input(locators.registerPage.InputUserAccount, data.registerData.InputUserAccount)
    And input(locators.registerPage.InputUserPassword, data.registerData.InputUserPassword)
    And input(locators.registerPage.InputUserConfirmPassword, data.registerData.InputUserPassword)
    And click(locators.registerPage.ButtonRegister)
    Then waitFor(locators.registerPage.NotiInvalidUserPhone)

  Scenario: kiểm tra nhập số điện thoại chỉ chứa khoảng trắng
    Given driver data.registerUrl
    And input(locators.registerPage.InputUserName, data.registerData.InputUserName)
    And input(locators.registerPage.InputUserPhone, data.invalidData.InputUserPhoneOnlySpace)
    And input(locators.registerPage.InputUserEmail, data.registerData.InputUserEmail)
    And input(locators.registerPage.InputUserAccount, data.registerData.InputUserAccount)
    And input(locators.registerPage.InputUserPassword, data.registerData.InputUserPassword)
    And input(locators.registerPage.InputUserConfirmPassword, data.registerData.InputUserPassword)
    And click(locators.registerPage.ButtonRegister)
    Then waitFor(locators.registerPage.NotiInvalidUserPhone)

  Scenario: kiểm tra nhập email > 255 ký tự
    Given driver data.registerUrl
    And input(locators.registerPage.InputUserName, data.registerData.InputUserName)
    And input(locators.registerPage.InputUserPhone, data.registerData.InputUserPhone)
    And input(locators.registerPage.InputUserEmail, data.invalidData.InputUserEmailOverLength)
    And input(locators.registerPage.InputUserAccount, data.registerData.InputUserAccount)
    And input(locators.registerPage.InputUserPassword, data.registerData.InputUserPassword)
    And input(locators.registerPage.InputUserConfirmPassword, data.registerData.InputUserPassword)
    And click(locators.registerPage.ButtonRegister)
    Then waitFor(locators.registerPage.NotiInvalidUserEmail)

  Scenario: kiểm tra nhập email chứa ký tự đặc biệt
    Given driver data.registerUrl
    And input(locators.registerPage.InputUserName, data.registerData.InputUserName)
    And input(locators.registerPage.InputUserPhone, data.registerData.InputUserPhone)
    And input(locators.registerPage.InputUserEmail, data.invalidData.InputUserEmailWithSpecialCharacters)
    And input(locators.registerPage.InputUserAccount, data.registerData.InputUserAccount)
    And input(locators.registerPage.InputUserPassword, data.registerData.InputUserPassword)
    And input(locators.registerPage.InputUserConfirmPassword, data.registerData.InputUserPassword)
    And click(locators.registerPage.ButtonRegister)
    Then waitFor(locators.registerPage.NotiInvalidUserEmail)

  Scenario: kiểm tra nhập email với đuôi không phải @gmail.com
    Given driver data.registerUrl
    And input(locators.registerPage.InputUserName, data.registerData.InputUserName)
    And input(locators.registerPage.InputUserPhone, data.registerData.InputUserPhone)
    And input(locators.registerPage.InputUserEmail, data.invalidData.InputUserEmailIncorrectExtension)
    And input(locators.registerPage.InputUserAccount, data.registerData.InputUserAccount)
    And input(locators.registerPage.InputUserPassword, data.registerData.InputUserPassword)
    And input(locators.registerPage.InputUserConfirmPassword, data.registerData.InputUserPassword)
    And click(locators.registerPage.ButtonRegister)
    Then waitFor(locators.registerPage.NotiInvalidUserEmail)

  Scenario: kiểm tra nhập email với đầu chỉ chứa khoảng trắng
    Given driver data.registerUrl
    And input(locators.registerPage.InputUserName, data.registerData.InputUserName)
    And input(locators.registerPage.InputUserPhone, data.registerData.InputUserPhone)
    And input(locators.registerPage.InputUserEmail, data.invalidData.InputUserEmailHeaderIsSpace)
    And input(locators.registerPage.InputUserAccount, data.registerData.InputUserAccount)
    And input(locators.registerPage.InputUserPassword, data.registerData.InputUserPassword)
    And input(locators.registerPage.InputUserConfirmPassword, data.registerData.InputUserPassword)
    And click(locators.registerPage.ButtonRegister)
    Then waitFor(locators.registerPage.NotiInvalidUserEmail)

  Scenario: kiểm tra nhập tên đăng nhập đã tồn tại
    Given driver data.registerUrl
    And input(locators.registerPage.InputUserName, data.registerData.InputUserName)
    And input(locators.registerPage.InputUserPhone, data.registerData.InputUserPhone)
    And input(locators.registerPage.InputUserEmail, data.registerData.InputUserEmail)
    And input(locators.registerPage.InputUserAccount, data.invalidData.InputUserAccountExists)
    And input(locators.registerPage.InputUserPassword, data.registerData.InputUserPassword)
    And input(locators.registerPage.InputUserConfirmPassword, data.registerData.InputUserPassword)
    And click(locators.registerPage.ButtonRegister)
    Then waitFor(locators.registerPage.NotiAccountExists)

  Scenario: kiểm tra nhập tên đăng nhập > 30 ký tự
    Given driver data.registerUrl
    And input(locators.registerPage.InputUserName, data.registerData.InputUserName)
    And input(locators.registerPage.InputUserPhone, data.registerData.InputUserPhone)
    And input(locators.registerPage.InputUserEmail, data.registerData.InputUserEmail)
    And input(locators.registerPage.InputUserAccount, data.invalidData.InputUserAccountOverLength)
    And input(locators.registerPage.InputUserPassword, data.registerData.InputUserPassword)
    And input(locators.registerPage.InputUserConfirmPassword, data.registerData.InputUserPassword)
    And click(locators.registerPage.ButtonRegister)
    Then waitFor(locators.registerPage.NotiInvalidAccount)

  Scenario: kiểm tra nhập tên đăng nhập < 6 ký tự
    Given driver data.registerUrl
    And input(locators.registerPage.InputUserName, data.registerData.InputUserName)
    And input(locators.registerPage.InputUserPhone, data.registerData.InputUserPhone)
    And input(locators.registerPage.InputUserEmail, data.registerData.InputUserEmail)
    And input(locators.registerPage.InputUserAccount, data.invalidData.InputUserAccountTooShort)
    And input(locators.registerPage.InputUserPassword, data.registerData.InputUserPassword)
    And input(locators.registerPage.InputUserConfirmPassword, data.registerData.InputUserPassword)
    And click(locators.registerPage.ButtonRegister)
    Then waitFor(locators.registerPage.NotiInvalidAccount)

  Scenario: kiểm tra nhập tên đăng nhập bắt đầu bằng chữ số
    Given driver data.registerUrl
    And input(locators.registerPage.InputUserName, data.registerData.InputUserName)
    And input(locators.registerPage.InputUserPhone, data.registerData.InputUserPhone)
    And input(locators.registerPage.InputUserEmail, data.registerData.InputUserEmail)
    And input(locators.registerPage.InputUserAccount, data.invalidData.InputUserAccountStartWithNumber)
    And input(locators.registerPage.InputUserPassword, data.registerData.InputUserPassword)
    And input(locators.registerPage.InputUserConfirmPassword, data.registerData.InputUserPassword)
    And click(locators.registerPage.ButtonRegister)
    Then waitFor(locators.registerPage.NotiInvalidAccount)

  Scenario: kiểm tra nhập tên đăng nhập chứa ký tự đặc biệt
    Given driver data.registerUrl
    And input(locators.registerPage.InputUserName, data.registerData.InputUserName)
    And input(locators.registerPage.InputUserPhone, data.registerData.InputUserPhone)
    And input(locators.registerPage.InputUserEmail, data.registerData.InputUserEmail)
    And input(locators.registerPage.InputUserAccount, data.invalidData.InputUserAccountWithSpecialCharacters)
    And input(locators.registerPage.InputUserPassword, data.registerData.InputUserPassword)
    And input(locators.registerPage.InputUserConfirmPassword, data.registerData.InputUserPassword)
    And click(locators.registerPage.ButtonRegister)
    Then waitFor(locators.registerPage.NotiInvalidAccount)

  Scenario: kiểm tra nhập tên đăng nhập chỉ chứa khoảng trắng
    Given driver data.registerUrl
    And input(locators.registerPage.InputUserName, data.registerData.InputUserName)
    And input(locators.registerPage.InputUserPhone, data.registerData.InputUserPhone)
    And input(locators.registerPage.InputUserEmail, data.registerData.InputUserEmail)
    And input(locators.registerPage.InputUserAccount, data.invalidData.InputUserAccountOnlySpace)
    And input(locators.registerPage.InputUserPassword, data.registerData.InputUserPassword)
    And input(locators.registerPage.InputUserConfirmPassword, data.registerData.InputUserPassword)
    And click(locators.registerPage.ButtonRegister)
    Then waitFor(locators.registerPage.NotiInvalidAccount)

  Scenario: kiểm tra nhập mật khẩu > 30 ký tự
    Given driver data.registerUrl
    And input(locators.registerPage.InputUserName, data.registerData.InputUserName)
    And input(locators.registerPage.InputUserPhone, data.registerData.InputUserPhone)
    And input(locators.registerPage.InputUserEmail, data.registerData.InputUserEmail)
    And input(locators.registerPage.InputUserAccount, data.registerData.InputUserAccount)
    And input(locators.registerPage.InputUserPassword, data.invalidData.InputUserPasswordOverLength)
    And input(locators.registerPage.InputUserConfirmPassword, data.registerData.InputUserPassword)
    And click(locators.registerPage.ButtonRegister)
    Then waitFor(locators.registerPage.NotiInvalidPassword)

  Scenario: kiểm tra nhập mật khẩu < 6 ký tự
    Given driver data.registerUrl
    And input(locators.registerPage.InputUserName, data.registerData.InputUserName)
    And input(locators.registerPage.InputUserPhone, data.registerData.InputUserPhone)
    And input(locators.registerPage.InputUserEmail, data.registerData.InputUserEmail)
    And input(locators.registerPage.InputUserAccount, data.registerData.InputUserAccount)
    And input(locators.registerPage.InputUserPassword, data.invalidData.InputUserPasswordTooShort)
    And input(locators.registerPage.InputUserConfirmPassword, data.registerData.InputUserPassword)
    And click(locators.registerPage.ButtonRegister)
    Then waitFor(locators.registerPage.NotiInvalidPassword)

  Scenario: kiểm tra nhập mật khẩu chỉ chứa khoảng trắng
    Given driver data.registerUrl
    And input(locators.registerPage.InputUserName, data.registerData.InputUserName)
    And input(locators.registerPage.InputUserPhone, data.registerData.InputUserPhone)
    And input(locators.registerPage.InputUserEmail, data.registerData.InputUserEmail)
    And input(locators.registerPage.InputUserAccount, data.registerData.InputUserAccount)
    And input(locators.registerPage.InputUserPassword, data.invalidData.InputUserPasswordOnlySpace)
    And input(locators.registerPage.InputUserConfirmPassword, data.invalidData.InputUserPasswordOnlySpace)
    And click(locators.registerPage.ButtonRegister)
    Then waitFor(locators.registerPage.NotiInvalidPassword)

  Scenario: kiểm tra nhập lại mật khẩu không khớp
    Given driver data.registerUrl
    And input(locators.registerPage.InputUserName, data.registerData.InputUserName)
    And input(locators.registerPage.InputUserPhone, data.registerData.InputUserPhone)
    And input(locators.registerPage.InputUserEmail, data.registerData.InputUserEmail)
    And input(locators.registerPage.InputUserAccount, data.registerData.InputUserAccount)
    And input(locators.registerPage.InputUserPassword, data.registerData.InputUserPassword)
    And input(locators.registerPage.InputUserConfirmPassword, data.invalidData.InputUserPasswordWrong)
    And click(locators.registerPage.ButtonRegister)
    Then waitFor(locators.registerPage.NotiInvalidConfirmPassword)

  Scenario: kiểm tra bấm nút đăng nhập
    Given driver data.registerUrl
    And click(locators.registerPage.ButtonLogin)
    Then waitFor(locators.loginPage.Title)

  @RegisterSuccess
  Scenario: kiểm tra đăng ký thành công
    * def now = java.time.LocalDateTime.now()
    * def formatter = java.time.format.DateTimeFormatter.ofPattern('yyyyMMddHHmmss')
    * def timestamp = now.format(formatter)
    * def account = 'A' + timestamp
    Given driver data.registerUrl
    And input(locators.registerPage.InputUserName, data.registerData.InputUserName)
    And input(locators.registerPage.InputUserPhone, data.registerData.InputUserPhone)
    And input(locators.registerPage.InputUserEmail, data.registerData.InputUserEmail)
    And input(locators.registerPage.InputUserAccount, account)
    And input(locators.registerPage.InputUserPassword, data.registerData.InputUserPassword)
    And input(locators.registerPage.InputUserConfirmPassword, data.registerData.InputUserPassword)
    And click(locators.registerPage.ButtonRegister)
    Then waitFor(locators.loginPage.NotiRegisterSuccess)