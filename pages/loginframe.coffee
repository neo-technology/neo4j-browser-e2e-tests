require('./waitReady')

class LoginFrame
  byUsername = By.model("username")
  byPassword = By.id("connect_password")
  byCurrentPassword = By.model("current_password")
  byNewPassword = By.model("new_password")
  byNewPasswordConfirmation = By.model("new_password2")
  byStatus = By.model("status-bar error")

  constructor: () ->

  defaultLogin: ->
    expect(element(byUsername).getAttribute('value')).toBe "neo4j"

    element(byPassword ).sendKeys("neo4j")
    element(byPassword ).sendKeys(protractor.Key.RETURN)
    browser.driver.wait(protractor.until.elementIsVisible(element(byNewPassword)))

  setNewLogin: (password) ->
    expect(element(byNewPassword).waitReady()).toBeTruthy()
    element(byNewPassword).sendKeys(password)
    element(byNewPasswordConfirmation).sendKeys(password)
    browser.driver.wait(protractor.until.elementIsNotVisible(element(byNewPassword)))

  login: (username, password) ->
    expect(element(byPassword).waitReady()).toBeTruthy();
    element(byPassword).sendKeys(password)
    element(byPassword).sendKeys(protractor.Key.RETURN)

    browser.driver.wait(protractor.until.elementIsNotVisible(element(byUsername)))

  resetPassword: ->
    element(byCurrentPassword).sendKeys("something")
    element(byNewPassword).sendKeys("neo4j")
    element(byNewPasswordConfirmation).sendKeys("neo4j")
    browser.sleep 1500
    element(byNewPasswordConfirmation).sendKeys(protractor.Key.RETURN)

module.exports = LoginFrame