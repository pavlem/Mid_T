# Mid_T

First checkout the project and start the **Mid_T.xcodeproj** file, there are no third party dependencies so no CocoaPods and similar and so it’s pretty simple. In case you want to build on a real device, add your bundle ID project settings. 

Based on the project request, the following has been done:

# User Interface:
* Just build the app and you will see the loading screen while the Launches collections data is being fetched from the API. When the data is fetched, Loading screen will disappear. 
* There are two part (upper with companies details and bottom with the list of launches which is scrollable).
* If you tap on any launch, a details screen opens with green halo around the image for the success launch state and a red halo for the fail launch state
* On a filter button, a modal screen appears where you can filter with three inputs (year, outcome of a launch and ordering). On the same screen you have Apply or reset filters

# Architecture:
* MMVM is used as an app design pattern since it complements Apple's native, out of the box, MVC for UIKit and its new MVVM in SwiftUI.
* Networking module is independent and can be implemented anywhere. It is based on Apple's “URLSession” and generics so no third party libs have been used.
* There is a custom loading screen and alert for the user feedback. 
* Unit tests example are made for view models. They are just examples and many more tests can be done
* File organisation: 
    * App - App related data 
    * Models
    * Views
    * ViewModels
    * Lib - all custom made libraries with the main one being the networking module under “Networking” 
    * Resources - images and other stuff
