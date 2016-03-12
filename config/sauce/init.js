require( 'coffee-script/register' );

exports.config = {

    onPrepare: function ()
    {
        global.Settings = {
          defaultTimeout: 2000,
          shortTimeout: 1000,
          longTimeout: 4000
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
    framework: 'jasmine',
    multiCapabilities: [
      {
          browserName: 'chrome',
          platform: 'OS X 10.10',
          name: 'Chrome-Mac',
          build: process.env.PROTRACTOR_BUILD_NUMBER
      }
    ],
    specs: [
        './../../pages/*.coffee',
        './../../scenarios/initialise-tests.coffee'
    ],
    jasmineNodeOpts: {
        showColors: true,
        defaultTimeoutInterval: 120000
    }
};
