import UIKit

@propertyWrapper
public struct Store<Value: PropertyListValue> {
  public let key: String
  public let defaultValue: Value
  public let userDefaults: UserDefaults
  
  public var wrappedValue: Value {
    get {
      userDefaults.object(forKey: key) as? Value ?? defaultValue
    }
    set {
      userDefaults.setValue(newValue, forKey: key)
    }
  }
  
  public init(_ key: String, defaultValue: Value, userDefaults: UserDefaults = .standard) {
    self.key = key
    self.defaultValue = defaultValue
    self.userDefaults = userDefaults
  }
}

/// A type than can be stored in `UserDefaults`.
///
/// - see https://github.com/apple/swift-corelibs-foundation/blob/ef6f96ee82ea0f54252071c0ecadf5f01be9aecc/Foundation/UserDefaults.swift#L58
public protocol PropertyListValue {}

extension Data: PropertyListValue {}
extension NSData: PropertyListValue {}

extension String: PropertyListValue {}
extension NSString: PropertyListValue {}

extension Date: PropertyListValue {}
extension NSDate: PropertyListValue {}

extension NSNumber: PropertyListValue {}
extension Bool: PropertyListValue {}
extension Int: PropertyListValue {}
extension Int8: PropertyListValue {}
extension Int16: PropertyListValue {}
extension Int32: PropertyListValue {}
extension Int64: PropertyListValue {}
extension UInt: PropertyListValue {}
extension UInt8: PropertyListValue {}
extension UInt16: PropertyListValue {}
extension UInt32: PropertyListValue {}
extension UInt64: PropertyListValue {}
extension Double: PropertyListValue {}
extension Float: PropertyListValue {}
#if os(macOS)
extension Float80: PropertyListValue {}
#endif
extension Array: PropertyListValue where Element: PropertyListValue {}
extension Dictionary: PropertyListValue where Key == String, Value: PropertyListValue {}
