//

//
// WEBRTC is supported on :
// - Android > 4.4
// - Chrome 26+
// - Firefox 23+
// - Edge 14+
// - Safari 11+
// from https://caniuse.com/#feat=rtcpeerconnection
// from http://peerjs.com/status/
// from http://peerjs.com/status/old
//


const browsers = {
  android: [
    {
      "browserName": "Browser",
      "deviceName": "Android GoogleAPI Emulator",
      "deviceOrientation": "portrait",
      "platformVersion": "5.1",
      "platformName": "Android"
    },
    {
      "browserName": "Chrome",
      "deviceName": "Android Emulator",
      "deviceOrientation": "portrait",
      "platformVersion": "6.0",
      "platformName": "Android"
    }
  ],
  chrome: [
    {
      "browserName": "chrome",
      "platform": "OS X 10.12",
      "version": "49"
    },
    {
      "browserName": "chrome",
      "platform": "OS X 10.12",
      "version": "60"
    },
    {
      "browserName": "chrome",
      "platform": "OS X 10.12",
      "version": "61"
    }
  ],
  firefox:[
    {
      "browserName": "firefox",
      "platform": "OS X 10.12",
      "version": "52"
    },
    {
      "browserName": "firefox",
      "platform": "OS X 10.12",
      "version": "55"
    },
    {
      "browserName": "firefox",
      "platform": "OS X 10.12",
      "version": "56"
    }
  ],
  edge: [
    {
      "browserName": "microsoftedge",
      "platform": "Windows 10",
      "version": "14"
    },
    {
      "browserName": "microsoftedge",
      "platform": "Windows 10",
      "version": "15"
    }
  ],
  iphone: [
    {
      "browserName": "safari",
      "deviceName": "iPhone 7 Simulator",
      "deviceOrientation": "portrait",
      "platformVersion": "11.0",
      "platformName": "iOs"
    }
  ],
  safari: [
    {
      "browserName": "safari",
      "platform": "OS X 10.12",
      "version": "11.0"
    }
  ]
}

module.exports = {
  "root": "app",
  "plugins": {
    "sauce": {
      "disabled": true,
      "browsers": browsers[process.env.BROWSER] || []
    }
  }
};
