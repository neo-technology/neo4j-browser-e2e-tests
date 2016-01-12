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

    sootElement: 'html',
    maxSessions: 1,
    framework: 'jasmine',
    capabilities: {
        browserName: 'chrome',
        platform: 'OS X 10.10',
        name: 'Chrome-Mac',
        build: process.env.PROTRACTOR_BUILD_NUMBER
    },
    specs: [
        './../pages/*.coffee',
        './../scenarios/login-tests.coffee',
        './../scenarios/stream-tests.coffee',
        './../scenarios/drawer-tests.coffee'
    ],
    jasmineNodeOpts: {
        showColors: true,
        defaultTimeoutInterval: 360000
    }
};
