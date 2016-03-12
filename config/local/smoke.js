require( 'coffee-script/register' );

exports.config = {

    onPrepare: function ()
    {
        global.Settings = {
          defaultTimeout: 500,
          shortTimeout: 250,
          longTimeout: 1000
        }
        global.By = protractor.By;
        browser.ignoreSynchronization = true;
        browser.getCapabilities().then( function ( cap )
        {
            browser.browserName = cap.caps_.browserName;
        } );
    },
    baseUrl: 'http://localhost:9000',
    rootElement: 'html',
    maxSessions: 1,
    framework: 'jasmine',
    capabilities: {
        browserName: 'chrome',
        name: 'Chrome'
    },
    specs: [
        './../../pages/*.coffee',
        './../../scenarios/login-tests.coffee',
        './../../scenarios/stream-tests.coffee',
        './../../scenarios/drawer-tests.coffee'
    ],
    jasmineNodeOpts: {
        showColors: true,
        defaultTimeoutInterval: 360000
    }
};
