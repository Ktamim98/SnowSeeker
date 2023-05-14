# SnowSeeker
SnowSeeker is a SwiftUI app that helps users to explore different ski resorts and find their favorite ones. The app provides information about each ski resort, including the number of runs, size, price, facilities, etc. Users can also add their favorite resorts to a favorites list for quick access.

https://github.com/Ktamim98/SnowSeeker/assets/124142522/cbfd7f34-7047-43d6-b90c-305a97509b25

## Features
- Explore different ski resorts with detailed information such as number of runs, size, price, facilities, and more.
- Add your favorite resorts to the favorites list for quick access.
- Dark mode support
- Accessible with Dynamic Type
- Support for landscape and portrait mode
- SwiftUI and Combine frameworks
- User defaults and JSON encoding/decoding


## Code Overview

### Models
#### Resort
- The Resort struct defines a ski resort with its properties such as name, country, description, price, size, facilities, and more. It also has a static example instance for testing purposes.

#### Facility
- The Facility struct defines a facility in a ski resort, such as a ski school, childcare, or fitness room. It has properties such as name, icon, and description.


### Views
#### ContentView
- The ContentView is the entry point of the app and contains a list of all ski resorts.

#### ResortsView
- The ResortsView is a detailed view of a selected ski resort. It displays information about the resort, such as its image, details, description, facilities, and more. It also allows users to add the resort to their favorites list.

#### ResortDetailsView
- The ResortDetailsView is a reusable view that displays the size and price of a resort.

#### SkiDetailsView
- The SkiDetailsView is a reusable view that displays the number of runs, lifts, and snow making facilities of a resort.


### Data
#### Favorites
- The Favorites class is an ObservableObject that manages the user's favorite ski resorts. It uses user defaults and JSON encoding/decoding to save and retrieve the data.

