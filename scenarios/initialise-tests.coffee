Page = require './../pages/page'

describe 'Setup', () ->
  page = new Page()

  it 'should set new password', ->
    page.visit()
    page.getLoginFrame().defaultLogin()
    page.getLoginFrame().setNewLogin("something")
    expect(page.latestFrame().taskRan()).not.toBe ':server connect'

