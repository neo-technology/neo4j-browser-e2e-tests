require( 'coffee-script/register' );

exports.config = {
    onPrepare: function ()
    {
        global.By = protractor.By;
        browser.ignoreSynchronization = true;
        browser.getCapabilities().then( function ( cap )
        {
            browser.browserName = cap.caps_.browserName;
        } );
    },
    baseUrl: 'http://localhost:7070/',
    rootElement: 'html',
    multiCapabilities: [
        {
            'browserName': 'chrome',
            'name': 'Chrome'
        }
    ],
    specs: [
        './pages/*.coffee',
        './scenarios/login-tests.coffee',
        './scenarios/stream-tests.coffee',
        './scenarios/drawer-tests.coffee',
        './scenarios/teardown-tests.coffee'
    ],

    framework: 'jasmine',

    jasmineNodeOpts: {
        showColors: true,
        defaultTimeoutInterval: 30000
    },
    maxSessions: 1
};
