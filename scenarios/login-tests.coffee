Page = require('./../pages/page')
LoginFrame = require('./../pages/loginframe')

describe 'Login frame', () ->
  page = new Page()

  it 'should load `:server connect` first', ->
    page.visit()
    expect(page.latestFrame().taskRan()).toBe ':server connect'

  it 'should login', ->
    page.getLoginFrame().login("neo4j", "something")
    expect(page.latestFrame().taskRan()).not.toBe ':server connect'

#  it 'should reset password', ->
#    page.editor(":clear").then(->
#      page.editor(":server change-password").then(->
#        expect(page.latestFrame().taskRan()).toBe ":server change-password"
#      )
#    )
#    loginFrame = new LoginFrame()
#    loginFrame.resetPassword()
#
#    page.getLoginFrame().defaultLogin()
#    expect(page.latestFrame().taskRan()).not.toBe ':server connect'
