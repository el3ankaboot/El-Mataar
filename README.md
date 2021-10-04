# El-Mataar

El-Mataar is an iOS application implemented using MVVM architecture using Swift 5.
The views were implemented using storyboards making use of UIKit.

This application loads data for airlines from an API, showing details for each airline , visiting this airline's website and adding a new airline.


### How to run "El-Mataar" ?
El-Mataar requires atleast iOS 11.0 as an iOS version.

To run the application follow the following steps :

* Clone this repository using the command ``$ git clone https://github.com/el3ankaboot/El-Mataar`` on your terminal , or by using sourcetree or by any other method you are comfortable with.
* Run the following command ``$ pod install`` on your terminal to install the pods.
* Open ``El-Mataar.xcworkspace``
* Run the application.


##### Note:
Kindly note that adding new airline adds dummy data as "Name NaaN" and this is related to the API and not an issue from the application side.
I tried to add a JSON from the app and from Postman and also it was added with dummy data. Thus, you will find in the application the API call doesn't take any parameters.