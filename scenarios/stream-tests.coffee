Page = require './../pages/page'

describe 'Stream', () ->
  page = new Page()

  it 'should focus on editor when pressing /', ->
    console.log browser.browserName
    unless browser.browserName is "firefox" or browser.browserName is "safari"
      page.keyPress("/testtesttesttesttesttest").then(->
      expect(element(By.css(".CodeMirror-code")).getText()).toContain "test")
    else
      console.log "SKIPPED in " + browser.browserName + " for now"

  it 'should show movie frame', ->
    page.editor(":play movies").then(->
      expect(page.latestFrame().taskRan()).toBe ":play movies"
    )

  it 'should pin frame', ->
    page.editor(":clear")
    expect(page.getFrameCount()).toBe 0

    page.editor(":play movies")
    expect(page.latestFrame().taskRan()).toBe ":play movies"
    expect(page.getFrameCount()).toBe 1
    page.editor(":play northwind graph")
    expect(page.latestFrame().taskRan()).toBe ":play northwind graph"
    expect(page.getFrameCount()).toBe 2

    page.latestFrame().close()

    expect(page.getFrameCount()).toBe 1


  it 'should be able to execute query from a frame', ->
    page.editor(":play movie graph")
    expect(page.latestFrame().taskRan()).toBe ":play movie graph"

    page.latestFrame().navigateRight()
    expect(page.latestFrame().getNavigateLeft().isDisplayed()).toBe true

    page.latestFrame().selectCypher()
    query = page.getEditor().getQuery().getText()
    page.getEditor().submit()

    expect(page.latestFrame().taskRan()).toContain query

    expect(page.latestFrame().tabIsOpen()).toBe "Graph"

#  it 'should go through history using up and down keys in the editor', ->
#    page.editor(":help")
#    expect(page.latestFrame().taskRan()).toBe ":help"
#    page.editor(":config")
#    expect(page.latestFrame().taskRan()).toBe ":config"
#    page.keyPress("/")
#    page.getEditor().historyUp()
#    expect(page.getEditor().getQuery()).toBe ":config"
#    page.getEditor().historyUp()
#    expect(page.getEditor().getQuery()).toBe ":help"
#    page.getEditor().historyDown()
#    expect(page.getEditor().getQuery()).toBe ":config"
