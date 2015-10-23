require( 'coffee-script/register' );

exports.config = {

    onPrepare: function ()
    {
        global.By = protractor.By;
        browser.ignoreSynchronization = true;
        browser.getCapabilities().then( function ( cap )
        {
            browser.browserName = cap.caps_.browserName;
        } )
    },

    sauceUser: process.env.SAUCE_USERNAME,
    sauceKey: process.env.SAUCE_ACCESS_KEY,

    baseUrl: 'http://localhost:7070/',
    rootElement: 'html',
    //maxSessions: 1,
    framework: 'jasmine',
    multiCapabilities: [
        {
            browserName: 'chrome',
            platform: 'OS X 10.10',
            name: 'Chrome-Mac'
        },
        {
            browserName: 'chrome',
            platform: 'Windows 8.1',
            name: 'Chrome-Windows'
        },
        {
            browserName: 'firefox',
            version: '41',
            platform: 'OS X 10.10',
            name: 'FireFox-Mac'
        },
        {
            browserName: 'firefox',
            platform: 'Windows 8.1',
            name: 'FireFox-Windows'
        },
        {
            browserName: 'safari',
            version: '9.0',
            platform: 'OS X 10.11',
            name: 'Safari-Mac'
        },
        {
            browserName: 'internet explorer',
            version: '11',
            platform: 'Windows 8.1',
            name: 'IE11-Windows'
        },
        {
            browserName: 'internet explorer',
            version: '10',
            name: 'IE10-Windows'
        }
    ],
    specs: [
        './pages/*.coffee',
        './scenarios/login-tests.coffee',
        './scenarios/stream-tests.coffee',
        './scenarios/drawer-tests.coffee',
        //'./scenarios/teardown-tests.coffee'
    ],
    jasmineNodeOpts: {
        showColors: true,
        defaultTimeoutInterval: 120000
    }
};
