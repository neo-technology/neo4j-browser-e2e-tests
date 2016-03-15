require('./waitReady')

class Frame
  EC = protractor.ExpectedConditions

  thisElement = null
  byTaskRan = By.css('.code.mono')
  byPin = By.css(".button.fa.fa-thumb-tack")
  byRight = By.css('.right')
  byLeft = By.css('.left')
  byCypher = By.css('.code.runnable')
  byClose = By.css('.button.fa.fa-times-circle')
  byFrame = By.css('.frame')
  byLeftFrameTabs = By.css('.left-frame-toggle')
  byActiveTab = By.css('.active')
  byViewResultError = By.css('.view-result-error')

  constructor: () ->
    thisElement = element.all(byFrame).first()
    expect(thisElement.waitReady()).toBeTruthy()

  taskRan: ->
    browser.sleep Settings.defaultTimeout
    thisElement.element(byTaskRan).getText()

  pin: ->
    thisElement.element(byPin).click()

  close: ->
    waitForStreamChangeWhen(thisElement.element(byClose), 'click')

  navigateRight: ->
    thisElement.element(byRight).click()
    browser.driver.wait(protractor.until.elementIsVisible(element(byLeft)))
    browser.sleep Settings.longTimeout

  getNavigateLeft: ->
    browser.driver.wait(protractor.until.elementIsVisible(element(byLeft)))
    thisElement.element(byLeft)

  selectCypher: ->
    browser.sleep Settings.longTimeout
    thisElement.element(byCypher).click()
    browser.sleep Settings.longTimeout

  tabIsOpen: ->
    element.all(byLeftFrameTabs).first().element(byActiveTab).getText()

  hasError: ->
    error = $$(byViewResultError)
    error.length > 0 && error.first().isDisplayed()

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

  waitForStreamChangeWhen = (elem, fnName) ->
    count = null
    element.all(byFrame).count().then(
      (originalCount) ->
        elem[fnName]()
        count = originalCount
        browser.driver.wait(->
          element.all(byFrame).count().then(
            (newCount) ->
              count != newCount
            )
        , Settings.longTimeout)
    )

module.exports = Frame
