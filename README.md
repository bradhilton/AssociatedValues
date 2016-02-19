# PropertyExtensions

`PropertyExtensions` allows you to easily add stored properties in class extensions:
```swift
extension UIView : PropertyExtensions {
  var identifier: String {
    get {
      return getProperty("identifier", initial: "Unknown")
    }
    set {
      setValue(newValue, forProperty: "identifier")
    }
  }
}
```

Enjoy!

## Installation

`PropertyExtensions` is available through [CocoaPods](http://cocoapods.org). To install, simply include the following lines in your podfile:
```ruby
use_frameworks!
pod 'PropertyExtensions'
```
Be sure to import the module at the top of your .swift files:
```swift
import PropertyExtensions
```
Alternatively, clone this repo or download it as a zip and include the classes in your project.

## Author

Brad Hilton, brad@skyvive.com

## License

`PropertyExtensions` is available under the MIT license. See the LICENSE file for more info.
