require('./waitReady')

class Editor
  bySubmit = By.css(".balled.success.active")
  byEditor = By.css(".CodeMirror-code pre")

  constructor: () ->

  execute: (cmd) ->
    browser.executeScript("var editor = $('.CodeMirror')[0].CodeMirror;editor.setValue('" + cmd + "');");
    @submit()
    browser.sleep 500

  submit: ->
    browser.sleep(500)
    element(bySubmit).click()
    browser.sleep(500)

  getQuery: ->
    element.all(byEditor).first()

  historyUp: ->
    element(By.css("#editor")).click()
    element(By.css("#editor")).sendKeys(protractor.Key.UP)

  historyDown: ->
    element(By.css("#editor")).click()
    element(By.css("#editor")).sendKeys(protractor.Key.DOWN)

module.exports = Editor