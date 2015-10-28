require( 'coffee-script/register' );
var ScreenShotReporter = require('protractor-screenshot-reporter');

exports.config = {
    onPrepare: function ()
    {
        global.By = protractor.By;
        browser.ignoreSynchronization = true;
        browser.getCapabilities().then( function ( cap )
        {
            browser.browserName = cap.caps_.browserName;
        } );

        jasmine.getEnv().addReporter(new ScreenShotReporter({
            baseDirectory: '/tmp/screenshots',
            takeScreenShotsOnlyForFailedSpecs: true
        }));
    },
    baseUrl: 'http://localhost:7474/',
    rootElement: 'html',
    multiCapabilities: [
        {
            browserName: 'chrome',
            name: 'Chrome'
        }
    ],
    specs: [
        './pages/*.coffee',
        './scenarios/initialise-tests.coffee',
        './scenarios/login-tests.coffee',
        './scenarios/stream-tests.coffee',
        './scenarios/drawer-tests.coffee',
        './scenarios/teardown-tests.coffee'
    ],

    framework: 'jasmine',

    jasmineNodeOpts: {
        showColors: true,
        defaultTimeoutInterval: 120000
    },
    maxSessions: 1
};
