require('./waitReady')

class Drawer
  byInfo = By.css("#leftbar .fa-info-circle")
  byOverview = By.css(".cover")
  byFavorite = By.css("#leftbar .fa-star")
  bySectionHeading = By.css(".pane h5")
  byPair = By.css(".pair")
  byDrawer = By.id("drawer")
  byPaneUl = By.css(".pane ul")
  byLinks = By.css(".pane a")
  byHeading = By.css('.pane h4')
  EC = protractor.ExpectedConditions

  constructor: ->
    @drawerMain = element(By.css("#leftbar"))
    if Version is '3.0'
      byInfo = By.css(".guides")
      byOverview = By.css(".database")
      byFavorite = By.css(".favorites")
      bySectionHeading = By.css(".pane h5")
      byPair = By.css(".pair")
      byDrawer = By.id("drawer")
      byPaneUl = By.css(".pane ul")
      byLinks = By.css(".pane a")
      byHeading = By.css('.pane h4')
    browser.driver.wait(protractor.until.elementIsVisible(element(byDrawer)))

  openOverview: ->
    element(byOverview).click().then ->
      browser.sleep Settings.longTimeout
      expect(element(byDrawer).isDisplayed()).toBeTruthy()

  openFavorties: ->
    element(byFavorite).click().then ->
      browser.sleep Settings.longTimeout
      expect(element(byDrawer).isDisplayed()).toBeTruthy()

  openInfo: ->
    element(byInfo).click().then ->
      browser.sleep Settings.longTimeout
      expect(element(byDrawer).isDisplayed()).toBeTruthy()

  closeInfo: ->
    element(byInfo).click()
    browser.sleep Settings.longTimeout
    expect(element(byDrawer).isDisplayed()).not.toBeTruthy()

  getAllLinks: ->
    element.all(byLinks).filter((elem, i) ->
      if elem.isDisplayed() then elem
    )

  getPairs: ->
    element.all(byPair)

  getPanes: ->
    panes = element.all(byPaneUl)
    guides: panes.get(0)
    reference: panes.get(1)
    examples: panes.get(2)
    helpSection: panes.get(3)

  headings: ->
    element.all(bySectionHeading)

module.exports = Drawer
