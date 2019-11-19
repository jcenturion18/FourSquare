# FourSquare

[![Platform](http://img.shields.io/badge/platform-ios-blue.svg?style=flat
)](https://developer.apple.com/iphone/index.action)
[![Language](http://img.shields.io/badge/language-swift-brightgreen.svg?style=flat
)](https://developer.apple.com/swift)
[![License](http://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat
)](http://mit-license.org)

## Description
The goal of the app is using [FourSquare API's](https://developer.foursquare.com/) navigate a map whith the current user location and show pins with the nearest places. And the posilility to show more information of that place in a specific view.

## Screenshots
| Map | Complete detail | Less detail|
| --- | --- | --- |
| ![Simulator Screen Shot - iPhone Xs - 2019-11-19 at 13 10 59](https://user-images.githubusercontent.com/7239318/69164056-0a442400-0ace-11ea-8ce8-0745a8ea308a.png) | ![Simulator Screen Shot - iPhone Xs - 2019-11-19 at 13 07 34](https://user-images.githubusercontent.com/7239318/69164044-03b5ac80-0ace-11ea-942a-e922875c1f11.png) |![Simulator Screen Shot - iPhone Xs - 2019-11-19 at 13 07 41](https://user-images.githubusercontent.com/7239318/69164045-044e4300-0ace-11ea-9e50-f7275b047e38.png) |

## The code.
The code has two viewcontrollers. The map and the view detail.

### The map
The map itself is using MapKit to create the map. And using `FourSquareService` create the API call to get the data. Tapping on an annotation will show basic information about the place and the posibillity to open a new view with more details. Moving arround will pop a button to show more places in that specific position and will dismiss the current card.

### View details
The view is composed by a scroll view and a stack view. The main idea behind this to use builders. The builder build a specific part of the view, creating atomics views. Based on the API response, each builder knows if hast to draw the view and in wich way to do it. In a more complex view, can be added builders who has more builders on it.

The presenter of the view has the first array of builders. Each one knows what to do. For example, `DetailVenueAddressBuilder` if there is specific data will create the view and populate, and `DetailVenueSocialBlockBuilder` will create the builders for the specific social media who is present on the API response

### External libs

#### [Alamofire](https://github.com/Alamofire/Alamofire)
Alamofire is an HTTP networking library written in Swift.
#### [Nuke](https://github.com/kean/Nuke)
Nuke provides a simple and efficient way to download and display images in your app.
#### [PureLayout](https://github.com/PureLayout/PureLayout)
The ultimate API for iOS & OS X Auto Layout

## Install and run

The project was created using `cocoapods 1.7.1` and `Xcode 10.2.1`

### Using Bundler
1. Clone the code
2. Run `bundle install`
3. Go to FourSquare
4. Run `bundle exec pod install`
5. Open `FourSquare.xcworkspace`

## Unit testing
The code was construct in a way that dependency injection will be easy to use. This help you to create mocks for specific parts of the code or external libraries, like the rest client.
