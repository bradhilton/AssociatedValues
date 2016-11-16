# AssociatedValues

`AssociatedValues` allows you to easily add stored properties in class extensions:
```swift
extension UIView {
  var identifier: String {
      get {
          return getAssociatedValue(key: "identifier", object: self, initialValue: "Unknown")
      }
      set {
          set(associatedValue: newValue, key: "identifier", object: self)
      }
  }
}
```

Enjoy!

## Installation

`AssociatedValues` is available through [CocoaPods](http://cocoapods.org). To install, simply include the following lines in your podfile:
```ruby
use_frameworks!
pod 'AssociatedValues'
```
Be sure to import the module at the top of your .swift files:
```swift
import AssociatedValues
```
Alternatively, clone this repo or download it as a zip and include the classes in your project.

## Author

Brad Hilton, brad@skyvive.com

## License

`AssociatedValues` is available under the MIT license. See the LICENSE file for more info.
