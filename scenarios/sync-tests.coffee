Page = require './../pages/page'

describe 'Sync', () ->
	page = new Page()

	it 'should ask user to agree to terms of use', ->
		page.editor(":play neo4j-sync")
		syncFrame = page.getSyncFrame()
		syncFrame.clickSignInButton()
		expect(syncFrame.getAlertMessage()).toBe("Before you can sign in, please check the box above to agree to the terms of use and privacy policy.")
		syncFrame.checkTermsAndConditionsBox()
		syncFrame.clickSignInButton()
		browser.getAllWindowHandles().then( (handles) ->
			newWindowHandle = handles[1];
			browser.switchTo().window(newWindowHandle).then( () ->
				expect(browser.driver.getCurrentUrl()).toBe("https://auth.neo4j.com/index.html")
			)
		)



