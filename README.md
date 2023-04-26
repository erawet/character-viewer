# CodingChallenge by Don E Wettasinghe
### Developer details
- Done by Don Wettasinghe
- email: erawet@gmail.com
- Mobile: 7573390854
### Features

- Lists All of the Character Names in a `UITableView` on the `MainViewController`.
- Uses `SplitViewController` to make the app accessable on an iPad.
- Two Different Varients of the application which use a shared Codebase.
- Create a Singleton for `APIHelper.swift` to make it easier to call network functions 
- Uses MVVM Design Pattern.

### Dependencies

-  I avoided implementing any Dependencies. Because it makes you easier to run the project.  

### Challenge Requirements Checklist

- [x] Comprised of two parts, a list and a detail.
- [x] On Phones, the list and detail should be separate screens, on Tablets, list and detail should appear on the same screen
- [x] For the list view, data should be displayed as a text only, vertically scrollable list of character names
- [x] The app should offer search functionality that filters the character list according to characters whose titles or descriptions contain the query text
- [x] Clicking on an item should load the detail view of that character, including the character’s image, title, and description.
- [x] For the image in the detail view, use the URL in the "Icon" field of the API JSON response. For items with blank or missing image URLs, use a placeholder image
- [x] Two variants of the app should be created, using a single shared codebase
- [x] Each variant should have a different name, package-name, and url that it pulls data from
- [x] Consider custom cells instead of storyboard.
- [x] Follow MVVM Design Pattern
- [x] Strong network framework


### How to use the app

In order to test the app, project files need to be opened in Xcode<br/>
After the project has been opened successfully in Xcode click on the Schemes tab and select either `SimpsonsCharacterViewer` or `TheWireCharacterViewer`. 
You can now run the application on a device of your choice. Depending on which scheme you chose the API will change between "http://api.duckduckgo.com/?q=simpsons+characters&format=json" & "http://api.duckduckgo.com/?q=the+wire+characters&format=json". 

