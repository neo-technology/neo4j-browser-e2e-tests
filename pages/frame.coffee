require('./waitReady')

class Frame
  byTaskRan = By.css('.code.mono')
  byPin = By.css(".button.fa.fa-thumb-tack")
  byRight = By.css('.right')
  byLeft = By.css('.left')
  byCypher = By.css('.code.runnable')
  byClose = By.css('.button.fa.fa-times-circle')
  byFrame = By.css('.frame')
  byLeftFrameTabs = By.css('.left-frame-toggle')
  byActiveTab = By.css('.active')

  constructor: () ->
    expect(element.all(byFrame).first().waitReady()).toBeTruthy()

  taskRan: ->
    browser.sleep Settings.defaultTimeout
    element.all(byFrame).first().element(byTaskRan).getText()

  pin: ->
    element.all(byFrame).first().element(byPin).click()
    browser.sleep Settings.defaultTimeout

  close: ->
    element.all(byFrame).first().element(byClose).click()
    browser.sleep Settings.defaultTimeout

  navigateRight: ->
    element.all(byFrame).first().element(byRight).click()
    browser.driver.wait(protractor.until.elementIsVisible(element(byLeft)))
    browser.sleep Settings.longTimeout

  getNavigateLeft: ->
    browser.driver.wait(protractor.until.elementIsVisible(element(byLeft)))
    element.all(byFrame).first().element(byLeft)

  selectCypher: ->
    browser.sleep Settings.longTimeout
    element.all(byFrame).first().element(byCypher).click()
    browser.sleep Settings.longTimeout

  tabIsOpen: ->
    browser.sleep Settings.longTimeout
    element.all(byLeftFrameTabs).first().element(byActiveTab).getText()

  downloadSVG:->
    element(byFrame).element(By.css(".actions")).element(By.css(".fa-download")).click()
    element(byFrame).element(By.css(".actions")).element(By.css(".fa-download")).element(By.cssContainingText("Export SVG"))

  downloadPNG:->
    element(byFrame).element(By.css(".actions")).element(By.css(".fa-download")).click()
    element(byFrame).element(By.css(".actions")).element(By.css(".fa-download")).element(By.cssContainingText("Export PNG"))

  downloadJSON:->
    element(byFrame).element(By.css(".actions")).element(By.css(".fa-download")).click()
    element(byFrame).element(By.css(".actions")).element(By.css(".fa-download")).element(By.cssContainingText("Export JSON"))

  downloadCSV:->
    element(byFrame).element(By.css(".actions")).element(By.css(".fa-download")).click()
    element(byFrame).element(By.css(".actions")).element(By.css(".fa-download")).element(By.cssContainingText("Export CSV"))

module.exports = Frame
