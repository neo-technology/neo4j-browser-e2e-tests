require('./waitReady')

class Drawer
  byInfo = By.css("#leftbar .fa-info-circle")
  byOverview = By.css(".cover")
  byFavorite = By.css("#leftbar .fa-star")
  byHeading = By.css(".pane h5")
  byPair = By.css(".pair")

  constructor: ->

  openOverview: ->
    element(byOverview).click()
    expect(element(By.id("drawer")).isDisplayed()).toBeTruthy()

  openFavorties: ->
    element(byFavorite).click()
    waitForAnimationToFinish()

  openInfo: ->
    element(byInfo).click()
    waitForAnimationToFinish()

  getAllLinks: ->
    element.all(By.css(".pane a")).filter( (elem, i) ->
        if elem.isDisplayed() then elem
    )

  getPairs: ->
    element.all(byPair)

  getPanes: ->
    guides: element.all(By.css(".pane ul")).get(0)
    reference: element.all(By.css(".pane ul")).get(1)
    examples: element.all(By.css(".pane ul")).get(2)
    help: element.all(By.css(".pane ul")).get(3)


  headings: ->
    element.all(byHeading)

  waitForAnimationToFinish= () ->
    browser.sleep(500)

module.exports = Drawer