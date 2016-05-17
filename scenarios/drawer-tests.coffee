Page = require './../pages/page'

describe 'Drawer', () ->
  page = new Page()
  drawer = null

  beforeEach ->
    page.clear()
    expect(page.getFrameCount()).toBe 0

  it 'should have defaults in overview draw', ->
    drawer = page.getDrawer()
    drawer.openOverview()

    drawer.getAllLinks().each ((elem) ->
      elem.click().then ->
        expect(page.latestFrame().hasError()).toBe no
    )

  describe 'should have content in info drawer', ->

    it 'should have expected sections', ->
      drawer.openInfo()
      expect(element.all(By.css(".pane ul")).count()).toBe 3
      panes = drawer.getPanes()
      expect(panes).not.toBe {} || `undefined`

      expect(panes.guides.all(By.css("a")).count()).toBe 3
      expect(panes.reference.all(By.css("a")).count()).toBe 4
      expect(panes.helpSection.all(By.css("a")).count()).toBe 4

    it 'should have working `guides` in info drawer', ->
      panes = page.getDrawer().getPanes()
      links = panes.guides.all(By.css("a"))
      expect(links.length).not.toBe 0
      links.each (elem) ->
        text = elem.getText()
        expect(text).not.toBe `undefined`
        elem.click().then ->
          expect(page.latestFrame().hasError()).toBe no
          expect(page.latestFrame().taskRan()).toContain elem.getAttribute("play-topic")

    it 'should have working `references` in info drawer', ->
      panes = page.getDrawer().getPanes()
      panes.reference.all(By.css("a")).each((elem)->
        elem.getAttribute("href").then((url)->
          expect(url).toContain "neo4j.com/"
        )
      )

    it 'should have working `help` in info drawer', ->
      panes = page.getDrawer().getPanes()

      panes.helpSection.all(By.css("a")).each((elem)->
        elem.click().then(->
          expect(page.latestFrame().hasError()).toBe no
          expect(page.latestFrame().taskRan()).toContain elem.getAttribute("help-topic")
        )
      )

  it 'should have four default folders and 3 headings', ->
    drawer = page.getDrawer()
    drawer.openFavorties()

    expect(drawer.headings().count()).toBe 7
