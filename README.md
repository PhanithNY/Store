# Store
A drop-in UserDefaults wrapper using @propertyWrapper.

## Usage
With Store, you can turn this:
```swift 
final class Storage {
  static let `default` = Storage()
  
  var launchCount: Int {
    get {
      return UserDefaults.standard.integer(forKey: "launchCount")
    }
    set {
      UserDefaults.standard.setValue(newValue, forKey: "launchCount")
    }
  }
}
```
to this:
```swift 
final class Storage {
  static let `default` = Storage()
  
  @Store(key: "launchCount", defaultValue: 1)
  var launchCount: Int
}
```

## Installation
Copy `Store.swift` to your project, or

### Swift Package Manager
From Xcode menu bar:

1. File
2. Swift Packages
3. Add Package Dependency...
4. Paste the repo url `https://github.com/PhanithNY/Store.git`


## Author

PhanithNY, ny.phanith.fe@gmail.com
