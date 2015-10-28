Page = require './../pages/page'

describe 'Setup', () ->
  page = new Page()

  it 'should set new password', ->
    page.visit()
    expect(page.latestFrame().taskRan()).toBe ':server connect'
    page.getLoginFrame().defaultLogin()
    page.getLoginFrame().setNewLogin("something")
    expect(page.latestFrame().taskRan()).not.toBe ':server connect'
    page.editor(":server disconnect")
