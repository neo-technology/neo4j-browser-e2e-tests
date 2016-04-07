Page = require './../pages/page'

describe 'Setup', () ->
  page = new Page()

  it 'should set new password', ->
    if Remote
      browser.get "/"
      command = ':config boltHost:"' + browser.baseUrl.replace('7474', '10000').replace('http://', '') + '"'
      page.editor command
      expect(page.latestFrame().taskRan()).toBe command
      browser.refresh()

    page.visit()

    page.editor(':server connect')
    expect(page.latestFrame().taskRan()).toBe ':server connect'
    page.getLoginFrame().defaultLogin()
    page.getLoginFrame().setNewLogin("a")
    expect(page.latestFrame().taskRan()).not.toBe ':server connect'
    page.editor(":server disconnect")

