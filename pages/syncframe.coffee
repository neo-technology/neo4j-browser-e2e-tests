require('./waitReady')

class SyncFrame
  byFrame = By.css('.frame')
  byTaskRan = By.css('.code.mono')
  byButton = By.css('.btn')
  byAlert = By.css('.alert-dismissable .ng-scope')
  byCheckbox = By.css('#acceptedTermsAndPrivacyCheckBox')

  constructor: ->
    @waitForStreamToContainSyncFrame()

  clickSignIn: ->
    @currentFrame()[0].element("button").click()

  currentFrame: ->
    element.all(byFrame).filter (frameElement) ->
      frameElement.element(byTaskRan).getText().then( (text) ->
        return text == ":play neo4j-sync"
      )

  clickSignInButton: ->
    @currentFrame().get(0).element(byButton).click()

  checkTermsAndConditionsBox: ->
    @currentFrame().get(0).element(byCheckbox).click()

  getAlertMessage: ->
    @currentFrame().get(0).element(byAlert).getText()

  waitForStreamToContainSyncFrame: ->
    that = @
    browser.driver.wait( ->
      that.currentFrame().count().then(
        (newCount) ->
          newCount > 0
      )
    ,Settings.longTimeout)

module.exports = SyncFrame
