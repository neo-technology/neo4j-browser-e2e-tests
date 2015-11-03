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
