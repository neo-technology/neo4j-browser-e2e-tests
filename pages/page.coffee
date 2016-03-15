Frame = require('./frame')
LoginFrame = require('./loginframe')
Editor = require('./editor')
Drawer = require('./drawer')

require('./waitReady')

class Page
  byFrame = By.css('.frame')

  constructor: ->

  visit: ->
    browser.get '/'
    expect(element(byFrame).waitReady()).toBeTruthy()
    browser.driver.wait(protractor.until.elementIsVisible(element(By.css('.frame'))) )

  latestFrame: ->
    new Frame()

  getDrawer: ->
    new Drawer()

  keyPress: (keys) ->
    element(By.css("body")).sendKeys(keys)

  editor: (cmd) ->
    editor = new Editor()
    editor.execute(cmd)

  getEditor: ->
    new Editor()

  getLoginFrame: ->
    new LoginFrame()

  getFrameCount: ->
    element.all(byFrame).count()

module.exports = Page
