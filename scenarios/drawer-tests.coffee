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

  describe 'should have content in info drawer', ->

    it 'should have expected sections', ->
      page.getDrawer().openInfo()
      expect(element.all(By.css(".pane ul")).count()).toBe 4
      panes = page.getDrawer().getPanes()
      expect(panes).not.toBe {} || `undefined`

      expect(panes.guides.all(By.css("a")).count()).toBe 3
      expect(panes.reference.all(By.css("a")).count()).toBe 4
      expect(panes.examples.all(By.css("a")).count()).toBe 3
      expect(panes.helpSection.all(By.css("a")).count()).toBe 4

    it 'should have working `guides` in info drawer', ->
      panes = page.getDrawer().getPanes()

      panes.guides.all(By.css("a")).each((elem)->
        elem.click().then(->
          expect(page.latestFrame().tabIsOpen()).not.toBe "Error"
          expect(page.latestFrame().taskRan()).toContain elem.getAttribute("play-topic")
        )
      )

    it 'should have working `references` in info drawer', ->
      panes = page.getDrawer().getPanes()
      panes.reference.all(By.css("a")).each((elem)->
        elem.getAttribute("href").then((url)->
          expect(url).toContain "neo4j.com/"
        )
      )
    it 'should have working `examples` in info drawer', ->
      panes = page.getDrawer().getPanes()
      panes.examples.all(By.css("a")).each((elem)->
        elem.click().then(->
          elem.getAttribute("play-topic").then((attribute) ->
            expect(page.latestFrame().tabIsOpen()).not.toBe "Error"
            expect(page.latestFrame().taskRan()).toContain attribute.split("-").join(" ")
          )
        )
      )
    it 'should have working `help` in info drawer', ->
      panes = page.getDrawer().getPanes()
      panes.helpSection.all(By.css("a")).each((elem)->
        elem.click().then(->
          expect(page.latestFrame().tabIsOpen()).not.toBe "Error"
          expect(page.latestFrame().taskRan()).toContain elem.getAttribute("help-topic")
        )
      )

  it 'should only have two folders default saved script folders', ->
    drawer = page.getDrawer()
    drawer.openFavorties()

    expect(drawer.headings().count()).toBe 4
