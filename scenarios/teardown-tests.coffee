Page = require './../pages/page'

describe 'Setup', () ->
  page = new Page()

  it 'should set new password', ->
    page.editor('MATCH (n) DETACH DELETE n')
    expect(page.latestFrame().taskRan()).toBe 'MATCH (n) DETACH DELETE n'

