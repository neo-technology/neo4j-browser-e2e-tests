Page = require './../pages/page'

describe 'Drawer', () ->
  page = new Page()

  it 'should have defaults in overview draw', ->
    drawer = page.getDrawer()
    drawer.openOverview()
    keyValues = page.getDrawer().getPairs().first()

    expect(keyValues.element(By.css(".key")).getText()).toContain("Location")
    expect(keyValues.element(By.css(".value")).getText()).toContain(".db")

    drawer.getAllLinks().each ((elem) ->
      elem.click().then(->
        expect(page.latestFrame().tabIsOpen()).not.toBe "Error"
      )
    )


  it 'should have expected info content', ->
    page.getDrawer().openInfo()
    expect(element.all(By.css(".pane ul")).count()).toBe 4

    panes = page.getDrawer().getPanes()

    expect(panes.guides.all(By.css("a")).count()).toBe 3
    expect(panes.reference.all(By.css("a")).count()).toBe 4
    expect(panes.examples.all(By.css("a")).count()).toBe 3
    expect(panes.help.all(By.css("a")).count()).toBe 4

    panes.guides.all(By.css("a")).each((elem)->
      elem.click().then(->
        expect(page.latestFrame().tabIsOpen()).not.toBe "Error"
        expect(page.latestFrame().taskRan()).toContain elem.getAttribute("play-topic")
      )
    )

    panes.reference.all(By.css("a")).each((elem)->
      elem.getAttribute("href").then((url)->
        expect(url).toContain "neo4j.com/"
      )
    )

    panes.examples.all(By.css("a")).each((elem)->
      elem.click().then(->
        elem.getAttribute("play-topic").then((attribute) ->
          expect(page.latestFrame().tabIsOpen()).not.toBe "Error"
          expect(page.latestFrame().taskRan()).toContain attribute.split("-").join(" ")
        )
      )
    )

    panes.help.all(By.css("a")).each((elem)->
      elem.click().then(->
        expect(page.latestFrame().tabIsOpen()).not.toBe "Error"
        expect(page.latestFrame().taskRan()).toContain elem.getAttribute("help-topic")
      )
    )

  it 'should only have two folders default saved script folders', ->
    drawer = page.getDrawer()
    drawer.openFavorties()

    expect(drawer.headings().count()).toBe 4
