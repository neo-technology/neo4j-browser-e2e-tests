class Stream
  byFrame = By.css('.frame')

  constructor: ->

  waitForStreamChangeWhen: (elem, fnName, args) ->
    count = null
    element.all(byFrame).count().then(
      (originalCount) ->
        elem[fnName](args)
        count = originalCount
        browser.driver.wait(->
          element.all(byFrame).count().then(
            (newCount) ->
              count != newCount
          )
        , Settings.longTimeout)
    )

  waitForStreamToBeClear: ->
    browser.driver.wait( ->
      element.all(byFrame).count().then(
        (newCount) ->
          newCount == 0
      )
    ,Settings.longTimeout)


module.exports = Stream