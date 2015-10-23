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

  taskRan: ->
    browser.sleep 500
    element(byFrame).element(byTaskRan).getText()

  pin: ->
    element(byFrame).element(byPin).click()
    browser.sleep 500

  close: ->
    element(byFrame).element(byClose).click()
    browser.sleep 500

  navigateRight: ->
    element(byFrame).element(byRight).click()
    browser.sleep 500

  getNavigateLeft: ->
    element(byFrame).element(byLeft)

  selectCypher: ->
    browser.sleep 500
    element(byFrame).element(byCypher).click()
    browser.sleep 500

  tabIsOpen: ->
    element(byLeftFrameTabs).element(byActiveTab).getText()

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