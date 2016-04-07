Page = require('./../pages/page')
LoginFrame = require('./../pages/loginframe')

describe 'Login frame', () ->
  page = new Page()

  it 'should load `:server connect` first when version bellow 3.0', ->
    if Version isnt '3.0'
      page.visit()
      expect(page.latestFrame().taskRan()).toBe ':server connect'

  it 'should load `:play neo4j-sync` first when version is 3.0', ->
    if Version is '3.0'

      if Remote
        browser.get '/'
        command = ':config boltHost:"' + browser.baseUrl.replace('7474', '10000').replace('http://', '') + '"'
        page.editor command
        expect(page.latestFrame().taskRan()).toBe command
        browser.refresh()
      page.visit()
      expect(page.latestFrame().taskRan()).toBe ':play neo4j-sync'

  it 'should login', ->
    page.visit()
    if Version is '3.0'
      page.editor(':server connect')

    expect(page.latestFrame().taskRan()).toBe ':server connect'

    page.getLoginFrame().login()
    expect(page.latestFrame().taskRan()).not.toBe ':server connect'
