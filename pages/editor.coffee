require('./waitReady')

class Editor
  bySubmit = By.css(".balled.success.active")
  byEditor = By.css(".CodeMirror-code pre")
  EC = protractor.ExpectedConditions

  constructor: () ->

  execute: (cmd) ->
    browser.executeScript("var editor = $('.CodeMirror')[0].CodeMirror;editor.setValue('" + cmd + "');");
    @submit()

  submit: ->
    browser.driver.wait(EC.presenceOf(element(bySubmit)), Settings.longTimeout)
    element(bySubmit).click()


  getQuery: ->
    element.all(byEditor).first()

  historyUp: ->
    element(By.css("#editor")).click()
    element(By.css("#editor")).sendKeys(protractor.Key.UP)

  historyDown: ->
    element(By.css("#editor")).click()
    element(By.css("#editor")).sendKeys(protractor.Key.DOWN)

module.exports = Editor
