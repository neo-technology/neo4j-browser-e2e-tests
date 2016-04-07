require('./waitReady')

class Editor
  bySubmit = By.css(".balled.success.active")
  byEditorText = By.css(".CodeMirror-code pre")
  byEditor = By.css(".CodeMirror-code")
  EC = protractor.ExpectedConditions

  constructor: () ->
    @editor = element(byEditor)
    if Version is '3.0'
      bySubmit = By.css(".play.active")

  execute: (cmd) ->
    browser.executeScript("var editor = $('.CodeMirror')[0].CodeMirror;editor.setValue('" + cmd + "');");
    @submit()

  submit: ->
    browser.driver.wait(EC.presenceOf(element(bySubmit)), Settings.longTimeout)
    element(By.css(".sl-play.active")).click()

  getQuery: ->
    element.all(byEditorText).first()

  getContent: ->
    @editor.getText()

  historyUp: ->
    element(By.css("#editor")).click()
    element(By.css("#editor")).sendKeys(protractor.Key.UP)

  historyDown: ->
    element(By.css("#editor")).click()
    element(By.css("#editor")).sendKeys(protractor.Key.DOWN)

module.exports = Editor
