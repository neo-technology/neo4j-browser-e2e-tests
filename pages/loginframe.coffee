require('./waitReady')

class LoginFrame
  byUsername = By.model("username")
  byPassword = By.id("connect_password")
  byCurrentPassword = By.model("current_password")
  byNewPassword = By.model("new_password")
  byNewPasswordConfirmation = By.model("new_password2")
  byConfirmPassword = By.id("set_connect_password")
  byStatus = By.model("status-bar error")

  constructor: () ->
    @password = "a"

  defaultLogin: ->
    expect(element(byUsername).getAttribute('value')).toBe "neo4j"

    element(byPassword).sendKeys("neo4j")
    element(byPassword).sendKeys(protractor.Key.RETURN)
    browser.driver.wait(protractor.until.elementIsVisible(element(byNewPassword)))

  setNewLogin: (password) ->
    expect(element(byNewPassword).waitReady()).toBeTruthy()
    element(byNewPassword).sendKeys(password)
    element(byNewPasswordConfirmation).sendKeys(password)
    browser.sleep Settings.longTimeout
#    element(byNewPasswordConfirmation).sendKeys(protractor.Key.RETURN)
    element(byConfirmPassword).click()
    browser.driver.wait(protractor.until.elementIsNotVisible(element(byNewPassword)))

  login: () ->
    expect(element(byPassword).waitReady()).toBeTruthy();
    element(byPassword).sendKeys(@password)
    element(byPassword).sendKeys(protractor.Key.RETURN)

    browser.driver.wait(protractor.until.elementIsNotVisible(element(byUsername)))

  resetPassword: ->
    element(byCurrentPassword).sendKeys(@password)
    element(byNewPassword).sendKeys("neo4j")
    element(byNewPasswordConfirmation).sendKeys("neo4j")
    browser.sleep 1500
    element(byNewPasswordConfirmation).sendKeys(protractor.Key.RETURN)

module.exports = LoginFrame
