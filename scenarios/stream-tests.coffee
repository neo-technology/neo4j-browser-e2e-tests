Page = require './../pages/page'

describe 'Stream', () ->
  page = new Page()

  it 'should focus on editor when pressing /', ->
    unless browser.browserName is "firefox" or browser.browserName is "safari"
      page.keyPress("/testtesttesttesttesttest").then(->
        expect(element(By.css(".CodeMirror-code")).getText()).toContain "test")
    else
      console.log "SKIPPED in " + browser.browserName + " for now"

  it 'should show movie frame', ->
    page.editor(":play movies").then(->
      expect(page.latestFrame().taskRan()).toBe ":play movies"
    )

  it 'should pin and close frame', ->
    page.editor(":clear")
    expect(page.getFrameCount()).toBe 0

    page.editor(":play movies")
    expect(page.latestFrame().taskRan()).toBe ":play movies"
    page.latestFrame().pin()
    expect(page.getFrameCount()).toBe 1

    page.editor(":play northwind graph")
    expect(page.latestFrame().taskRan()).toBe ":play movies"
    expect(page.getFrameCount()).toBe 2

    page.latestFrame().close()

    expect(page.getFrameCount()).toBe 1


  it 'should be able to execute query from a frame', ->
    page.editor(":clear")
    page.editor(":play movie graph")
    expect(page.latestFrame().taskRan()).toBe ":play movie graph"

    page.latestFrame().navigateRight()
    expect(page.latestFrame().getNavigateLeft().isDisplayed()).toBe true

    page.latestFrame().selectCypher()
    query = page.getEditor().getQuery().getText()
    expect(query).toContain "CREATE"
    page.getEditor().submit()

    browser.sleep Settings.longTimeout

    # We should assert against the query from the guide frame (pe4cey)
    expect(page.latestFrame().taskRan()).toContain query
