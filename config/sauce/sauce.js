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

    sauceUser: process.env.SAUCE_USERNAME,
    sauceKey: process.env.SAUCE_ACCESS_KEY,
    baseUrl: process.env.BASE_URL,
    rootElement: 'html',
    maxSessions: 1,
    framework: 'jasmine',
    multiCapabilities: [
        {
            browserName: 'chrome',
            platform: 'OS X 10.10',
            name: 'Chrome-Mac',
            build: process.env.PROTRACTOR_BUILD_NUMBER
        },
        // {
        //     browserName: 'chrome',
        //     platform: 'Windows 8.1',
        //     name: 'Chrome-Windows',
        //     build: process.env.PROTRACTOR_BUILD_NUMBER
        // },
        // {
        //     browserName: 'firefox',
        //     version: '41',
        //     platform: 'OS X 10.10',
        //     name: 'FireFox-Mac',
        //     build: process.env.PROTRACTOR_BUILD_NUMBER
        // },
        // {
        //     browserName: 'firefox',
        //     platform: 'Windows 8.1',
        //     name: 'FireFox-Windows',
        //     build: process.env.PROTRACTOR_BUILD_NUMBER
        // },
        // {
        //     browserName: 'safari',
        //     version: '9.0',
        //     platform: 'OS X 10.11',
        //     name: 'Safari-Mac',
        //     build: process.env.PROTRACTOR_BUILD_NUMBER
        // },
        // {
        //     browserName: 'internet explorer',
        //     version: '11',
        //     platform: 'Windows 8.1',
        //     name: 'IE11-Windows',
        //     build: process.env.PROTRACTOR_BUILD_NUMBER
        // },
        // {
        //     browserName: 'internet explorer',
        //     version: '10',
        //     name: 'IE10-Windows 10',
        //     build: process.env.PROTRACTOR_BUILD_NUMBER
        // },
        //{
        //    browserName: 'microsoftedge',
        //    platform: 'Windows 10',
        //    version: '20.10240',
        //    name: 'EDGE-Windows 10',
        //    build: process.env.BUILD_NUMBER
        //}
    ],
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
