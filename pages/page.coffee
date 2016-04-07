Frame = require('./frame')
LoginFrame = require('./loginframe')
Editor = require('./editor')
Drawer = require('./drawer')
Stream = require('./stream')

class Page
  byFrame = By.css('.frame')
  byMessageBar = By.css('.message-bar')

  constructor: ->

  visit: ->
    browser.get '/'
    expect(element(byFrame).waitReady()).toBeTruthy()
    browser.driver.wait(protractor.until.elementIsVisible(element(By.css('.frame'))))

  clickMessageBar: ->
    browser.driver.wait(protractor.until.elementIsVisible(element(byMessageBar)))
    element(byMessageBar).click()
    editor = new Editor()
    editor.submit()

  latestFrame: ->
    new Frame()

  getDrawer: ->
    new Drawer()

  keyPress: (keys) ->
    element(By.css("body")).sendKeys(keys)

  editor: (cmd) ->
    editor = new Editor()
    @getStream().waitForStreamChangeWhen(editor, 'execute', cmd)

  clear: ->
    editor = new Editor()
    editor.execute(":clear")
    @getStream().waitForStreamToBeClear()

  getEditor: ->
    new Editor()

  getLoginFrame: ->
    new LoginFrame()

  getFrameCount: ->
    element.all(byFrame).count()

  getStream: ->
    new Stream()

module.exports = Page
