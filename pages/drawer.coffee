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

  openOverview: ->
    element(byOverview).click()
    browser.sleep 2000
    expect(element(byDrawer).isDisplayed()).toBeTruthy()

  openFavorties: ->
    element(byFavorite).click()
    browser.sleep 2000
    expect(element(byDrawer).isDisplayed()).toBeTruthy()

  openInfo: ->
    element(byInfo).click()
    browser.sleep 2000
    expect(element(byDrawer).isDisplayed()).toBeTruthy()

  getAllLinks: ->
    element.all(By.css(".pane a")).filter( (elem, i) ->
        if elem.isDisplayed() then elem
    )

  getPairs: ->
    element.all(byPair)

  getPanes: ->
    browser.sleep 1000
    panes = element.all(byPaneUl)
    guides: panes.get(0)
    reference: panes.get(1)
    examples: panes.get(2)
    helpSection: panes.get(3)

  headings: ->
    element.all(byHeading)

  waitForAnimationToFinish= () ->
    browser.sleep 2000
    expect(element(byDrawer).isDisplayed()).toBeTruthy()

module.exports = Drawer