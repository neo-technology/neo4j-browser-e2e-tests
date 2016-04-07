Page = require './../pages/page'

describe 'Stream', () ->
  page = new Page()

  knownCommands = [":schema", ":play sysinfo"]
  if Version is '3.0'

    knownCommands.concat([
      'CALL sys.procedures',
      'CALL sys.queryJmx("")',
      'CALL db.constraints',
      'CALL db.indexes',
      'CALL db.labels',
      'CALL db.propertyKeys',
      'CALL db.relationshipTypes',
      'CALL db.components'
    ])

  beforeEach ->
    page.clear()
    expect(page.getFrameCount()).toBe 0

  it 'should run known commands in the editor', ->
    knownCommands.forEach (command)->

      page.editor(command)
      expect(page.latestFrame().taskRan()).toBe command
      expect(page.latestFrame().hasError()).toBe no
