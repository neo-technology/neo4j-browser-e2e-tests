require('./waitReady')

class Frame
  EC = protractor.ExpectedConditions

  thisElement = null
  byTaskRan = By.css('.code.mono')
  byPin = By.css(".button.sl.sl-pin")
  byRight = By.css('.right')
  byLeft = By.css('.left')
  byCypher = By.css('.code.runnable')
  byClose = By.css('.button.sl.sl-delete')
  byFrame = By.css('.frame')
  byLeftFrameTabs = By.css('.left-frame-toggle')
  byActiveTab = By.css('.active')
  byViewResultError = By.css('.view-result-error')
  byViewResult = By.css('.view-result')
  byNoThanks = By.css('.no-thanks')
  bySpinner = By.css('.spinner')

  constructor: () ->
    expect(element.all(byFrame).first().waitReady()).toBeTruthy()
    thisElement = element.all(byFrame).first()

  taskRan: ->
    browser.sleep Settings.defaultTimeout
    thisElement.element(byTaskRan).getText()

  loadToComplete: ->
    browser.sleep 10000

  pin: ->
    thisElement.element(byPin).click()

  close: ->
    waitForStreamChangeWhen(thisElement.element(byClose), 'click')

  clickNoThanks: ->
    thisElement.element(byNoThanks).click()

  navigateRight: ->
    thisElement.element(byRight).click()
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
    browser.driver.wait(protractor.until.elementIsVisible(element.all(byViewResult).first()))
    error = element.all(byViewResultError)
    error.length > 0 && error.first().isDisplayed() && element(".fa.fa-file-text-o").isVisible()

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
