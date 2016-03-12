require('./waitReady')

class Drawer
  byInfo = By.css("#leftbar .fa-info-circle")
  byOverview = By.css(".cover")
  byFavorite = By.css("#leftbar .fa-star")
  byHeading = By.css(".pane h5")
  byPair = By.css(".pair")
  byDrawer = By.id("drawer")
  byPaneUl = By.css(".pane ul")

  constructor: ->
    Settings.longTimeout

  openOverview: ->
    element(byOverview).click()
    browser.sleep Settings.longTimeout
    expect(element(byDrawer).isDisplayed()).toBeTruthy()

  openFavorties: ->
    element(byFavorite).click()
    browser.sleep Settings.longTimeout
    expect(element(byDrawer).isDisplayed()).toBeTruthy()

  openInfo: ->
    element(byInfo).click()
    browser.sleep Settings.longTimeout
    expect(element(byDrawer).isDisplayed()).toBeTruthy()

  getAllLinks: ->
    browser.sleep Settings.longTimeout
    element.all(By.css(".pane a")).filter( (elem, i) ->
        if elem.isDisplayed() then elem
    )

  getPairs: ->
    element.all(byPair)

  getPanes: ->
    browser.sleep Settings.longTimeout
    panes = element.all(byPaneUl)
    guides: panes.get(0)
    reference: panes.get(1)
    examples: panes.get(2)
    helpSection: panes.get(3)

  headings: ->
    element.all(byHeading)

  waitForAnimationToFinish= () ->
    browser.sleep Settings.defaultTimeout
    expect(element(byDrawer).isDisplayed()).toBeTruthy()

module.exports = Drawer
