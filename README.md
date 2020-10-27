# nvlp
NVLP - Excercise

# Instructions

   Requirements:
  * Xcode 12 / Swift 5 
  * iOS >= 14.0 
  * Cocoapods

This project uses cocoapods, after installing cocoapods, please do pod install do download and link against the external libraries used in this project.
To install cocoapods, please go to your terminal and type: $ sudo gem install cocoapods.

Then navigate to your project directory and type :

pod install

Full details on cocoapods can be found here:
https://cocoapods.org

After installation the app can be run in a simulator or a device.

Tests can be run from the test navigator in xcode.

# Objectives

The application is required to do the following :

1. Check the health of the network using an endpoint
2. Validate an email address
3. Obtain a authorisation token to authenticate against the SSE server.
4. Authenticate against the SSE server .
5. Update prices of 8 currencies and update a graph showing values and changes since last update.



# Architecture

The application has followed a basis MVVM pattern, with some class extensions and one subclass for convenience methods. 

The networking layer follows a protocol based approach, using URLSession, AlamoFire is used to connect to the Server Sent Events server.

The secure Keychain is used to store the token.

Tests have been written for the models and viewcontrollers


# Libraries

1. AlamoFire.  - Networking
2. SwiftyJSON. - JSON parsing
3. SwiftyKeychainWrapper - KeyChain wrapper
4. KRProgressHUD - Activity indicator
5. Charts.  - Charting and graphs.


# Next Steps - Further Development

* Improve test coverage by writing tess for the networking layer using mock objects and stubs.
* Introduce presenters to allow dependency injection of values into viewcontrollers to improve testability.
* Format charts to improve readability.
* Basic UI tests.











