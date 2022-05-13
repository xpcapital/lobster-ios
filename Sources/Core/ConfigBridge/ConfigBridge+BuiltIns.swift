//  Copyright © 2020 Suguru Kishimoto. All rights reserved.
//

import Foundation
import FirebaseRemoteConfig

// MARK: - ConfigBridge for `String`

public final class ConfigStringBridge: ConfigBridge<String> {
    
    /** Save the `String` value in the default store */
    public override func save(key: String, value: String?, defaultsStore: DefaultsStore) {
        defaultsStore[key] = value
    }

    /**
     Gets the `String` value asked for the given key. Check and take value in this order:
     1. Amplitude Experiment
     2. Remote Config
     */
    public override func get(key: String, remoteConfig: RemoteConfig, experimentVariants: [String: Any]) -> String? {
        if let experimentValue = experimentVariants[key] as? String {
            return experimentValue
        } else {
            return remoteConfig[key].stringValue
        }
    }

    /** Gets the `String` value from the default store */
    public override func get(key: String, defaultsStore: DefaultsStore) -> String? {
        return defaultsStore[key] as? String
    }
}

// MARK: - ConfigBridge for `Int`

public final class ConfigIntBridge: ConfigBridge<Int> {
    
    /** Save the `Int?` value in the default store */
    public override func save(key: String, value: Int?, defaultsStore: DefaultsStore) {
        defaultsStore[key] = value
    }

    /**
     Gets the `Int?` value asked for the given key. Check and take value in this order:
     1. Amplitude Experiment
     2. Remote Config
     */
    public override func get(key: String, remoteConfig: RemoteConfig, experimentVariants: [String: Any]) -> Int? {
        if let experimentValue = experimentVariants[key] as? Int {
            return experimentValue
        } else {
            return remoteConfig[key].numberValue.intValue
        }
    }

    /** Gets the `Int?` value from the default store */
    public override func get(key: String, defaultsStore: DefaultsStore) -> Int? {
        return defaultsStore[key] as? Int
    }
}

// MARK: - ConfigBridge for `Double`

public final class ConfigDoubleBridge: ConfigBridge<Double> {
    
    /** Save the `Double` value in the default store */
    public override func save(key: String, value: Double?, defaultsStore: DefaultsStore) {
        defaultsStore[key] = value
    }

    /**
     Gets the `Double` value asked for the given key. Check and take value in this order:
     1. Amplitude Experiment
     2. Remote Config
     */
    public override func get(key: String, remoteConfig: RemoteConfig, experimentVariants: [String: Any]) -> Double? {
        if let experimentValue = experimentVariants[key] as? Double {
            return experimentValue
        } else {
            return remoteConfig[key].numberValue.doubleValue
        }
    }

    /** Gets the `Double` value from the default store */
    public override func get(key: String, defaultsStore: DefaultsStore) -> Double? {
        return defaultsStore[key] as? Double
    }
}

// MARK: - ConfigBridge for `Float`

public final class ConfigFloatBridge: ConfigBridge<Float> {
    
    /** Save the `Float` value in the default store */
    public override func save(key: String, value: Float?, defaultsStore: DefaultsStore) {
        defaultsStore[key] = value
    }

    /**
     Gets the `Float` value asked for the given key. Check and take value in this order:
     1. Amplitude Experiment
     2. Remote Config
     */
    public override func get(key: String, remoteConfig: RemoteConfig, experimentVariants: [String: Any]) -> Float? {
        if let experimentValue = experimentVariants[key] as? Double {
            return Float(experimentValue)
        } else {
            return remoteConfig[key].numberValue.floatValue
        }
    }

    /** Gets the `Float` value from the default store */
    public override func get(key: String, defaultsStore: DefaultsStore) -> Float? {
        return defaultsStore[key] as? Float
    }
}

// MARK: - ConfigBridge for `Bool`

public final class ConfigBoolBridge: ConfigBridge<Bool> {
    
    /** Save the `Bool` value in the default store */
    public override func save(key: String, value: Bool?, defaultsStore: DefaultsStore) {
        defaultsStore[key] = value
    }

    /**
     Gets the `Bool` value asked for the given key. Check and take value in this order:
     1. Amplitude Experiment
     2. Remote Config
     */
    public override func get(key: String, remoteConfig: RemoteConfig, experimentVariants: [String: Any]) -> Bool? {
        if let experimentValue = experimentVariants[key] as? Bool {
            return experimentValue
        } else {
            return remoteConfig[key].boolValue
        }
    }

    /** Gets the `Bool` value from the default store */
    public override func get(key: String, defaultsStore: DefaultsStore) -> Bool? {
        return defaultsStore[key] as? Bool
    }
}

// MARK: - ConfigBridge for `Data`

public final class ConfigDataBridge: ConfigBridge<Data> {
    
    /** Save the `Data` value in the default store */
    public override func save(key: String, value: Data?, defaultsStore: DefaultsStore) {
        defaultsStore[key] = value
    }

    /**
     Gets the `Data` value asked for the given key. Check and take value in this order:
     1. Amplitude Experiment
     2. Remote Config
     */
    public override func get(key: String, remoteConfig: RemoteConfig, experimentVariants: [String: Any]) -> Data? {
        if let experimentValue = experimentVariants[key] as? Data {
            return experimentValue
        } else {
            return remoteConfig[key].dataValue
        }
    }

    /** Gets the `Data` value from the default store */
    public override func get(key: String, defaultsStore: DefaultsStore) -> Data? {
        return defaultsStore[key] as? Data
    }
}

// MARK: - ConfigBridge for `URL`

public final class ConfigURLBridge: ConfigBridge<URL> {
    
    /** Save the `URL` value in the default store */
    public override func save(key: String, value: URL?, defaultsStore: DefaultsStore) {
        defaultsStore[key] = value?.absoluteString
    }

    /**
     Gets the `URL` value asked for the given key. Check and take value in this order:
     1. Amplitude Experiment
     2. Remote Config
     */
    public override func get(key: String, remoteConfig: RemoteConfig, experimentVariants: [String: Any]) -> URL? {
        if let experimentValue = experimentVariants[key] {
            return (experimentValue as? String).flatMap(URL.init(string:))
        } else {
            return remoteConfig[key].stringValue.flatMap(URL.init(string:))
        }
    }

    /** Gets the `URL` value from the default store */
    public override func get(key: String, defaultsStore: DefaultsStore) -> URL? {
        return (defaultsStore[key] as? String).flatMap(URL.init(string:))
    }
}

// MARK: - ConfigBridge for `UIColor`

public final class ConfigColorBridge: ConfigBridge<UIColor> {
    
    /** Save the `UIColor` value in the default store */
    public override func save(key: String, value: UIColor?, defaultsStore: DefaultsStore) {
        defaultsStore[key] = value?.hexString
    }

    /**
     Gets the `UIColor` value asked for the given key. Check and take value in this order:
     1. Amplitude Experiment
     2. Remote Config
     */
    public override func get(key: String, remoteConfig: RemoteConfig, experimentVariants: [String: Any]) -> UIColor? {
        if let experimentValue = experimentVariants[key] {
            return (experimentValue as? String).flatMap { $0.hexColor }
        } else {
            return remoteConfig[key].stringValue.flatMap { $0.hexColor }
        }
    }

    /** Gets the `UIColor` value from the default store */
    public override func get(key: String, defaultsStore: DefaultsStore) -> UIColor? {
        return (defaultsStore[key] as? String).flatMap { $0.hexColor }
    }
}

// MARK: - ConfigBridge for `RawRepresentable` (Enum)

public final class ConfigRawRepresentableBridge<T: RawRepresentable>: ConfigBridge<T> {
    
    /** Save the `RawRepresentable` value in the default store */
    public override func save(key: String, value: T?, defaultsStore: DefaultsStore) {
        defaultsStore[key] = value?.rawValue
    }

    /**
     Gets the `RawRepresentable` value asked for the given key. Check and take value in this order:
     1. Amplitude Experiment
     2. Remote Config
     */
    public override func get(key: String, remoteConfig: RemoteConfig, experimentVariants: [String: Any]) -> T? {
        return experimentVariants[key].flatMap(deserialize) ??
            remoteConfig[key].stringValue.flatMap(deserialize) ??
            deserialize(remoteConfig[key].numberValue)
    }

    /** Gets the `RawRepresentable` value from the default store */
    public override func get(key: String, defaultsStore: DefaultsStore) -> T? {
        return defaultsStore[key].flatMap(deserialize)
    }

    /** Deserialize a remote value (Experiment or Remote Config) into a `RawRepresentable` object */
    func deserialize(_ object: Any) -> T? {
        return (object as? T.RawValue).flatMap(T.init(rawValue:))
    }
}

// MARK: - ConfigBridge for `Decodable`
///
/// - note: You can't set default value if a value is `Decodable` object, not `Encodable` object.
///  If you can set default value, Please make object conform to `Encodable` and use `ConfigCodableBridge`.
///
public final class ConfigDecodableBridge<T: Decodable>: ConfigBridge<T> {

    /** ⚠️ `save(key:, value:, defaultsStore:)` method in not available for the `Decodable` type */
    public override func save(key: String, value: T?, defaultsStore: DefaultsStore) { }

    /**
     Gets the `Decodable` value asked for the given key. Check and take value in this order:
     1. Amplitude Experiment
     2. Remote Config
     */
    public override func get(key: String, remoteConfig: RemoteConfig, experimentVariants: [String: Any], decoder: JSONDecoder) -> T? {
        return experimentDeserialize(for: key, from: experimentVariants, decoder) ??
            remoteConfigDeserialize(remoteConfig[key].dataValue, decoder) ??
            remoteConfig[key].stringValue?.data(using: .utf8).flatMap { remoteConfigDeserialize($0, decoder) }
    }

    /** ⚠️ `get(key:, defaultsStore:, decoder:)` method in not available for the `Decodable` type */
    public override func get(key: String, defaultsStore: DefaultsStore, decoder: JSONDecoder) -> T? {
        return nil
    }

    /** Deserialize a Remote Config value into a `Decodable` object */
    func remoteConfigDeserialize(_ object: Any, _ decoder: JSONDecoder) -> T? {
        return (object as? Data).flatMap { try? decoder.decode(T.self, from: $0) }
    }
    
    /** Deserialize an Amplitude Experiment value into a `Decodable` object */
    func experimentDeserialize(for key: String, from experimentVariants: [String: Any], _ decoder: JSONDecoder) -> T? {
        guard let experimentJSONValue = experimentVariants[key],
              let experimentDictionary = experimentJSONValue as? [String: Any],
              let dictionaryEncoded = try? JSONSerialization.data(withJSONObject: experimentDictionary) else {
            return nil
        }

        do {
            return try decoder.decode(T.self, from: dictionaryEncoded)
        } catch {
            return nil
        }
    }
}

// MARK: - ConfigBridge for `Codable`

public final class ConfigCodableBridge<T: Codable>: ConfigBridge<T> {

    /** Save the `Codable` value in the default store */
    public override func save(key: String, value: T?, defaultsStore: DefaultsStore, encoder: JSONEncoder) {
        defaultsStore[key] = try? encoder.encode(value)
    }

    /**
     Gets the `Codable` value asked for the given key. Check and take value in this order:
     1. Amplitude Experiment
     2. Remote Config
     */
    public override func get(key: String, remoteConfig: RemoteConfig, experimentVariants: [String: Any], decoder: JSONDecoder) -> T? {
        return experimentDeserialize(for: key, from: experimentVariants, decoder) ??
            remoteConfigDeserialize(remoteConfig[key].dataValue, decoder) ??
            remoteConfig[key].stringValue?.data(using: .utf8).flatMap { remoteConfigDeserialize($0, decoder) }
    }

    /** Gets the `Codable` value from the default store */
    public override func get(key: String, defaultsStore: DefaultsStore, decoder: JSONDecoder) -> T? {
        return defaultsStore[key].flatMap { remoteConfigDeserialize($0, decoder)}
    }

    /** Deserialize a Remote Config value into a `Codable` object */
    func remoteConfigDeserialize(_ object: Any, _ decoder: JSONDecoder) -> T? {
        return (object as? Data).flatMap { try? decoder.decode(T.self, from: $0) }
    }
    
    /** Deserialize an Amplitude Experiment value into a `Codable` object */
    func experimentDeserialize(for key: String, from experimentVariants: [String: Any], _ decoder: JSONDecoder) -> T? {
        guard let experimentJSONValue = experimentVariants[key],
              let experimentDictionary = experimentJSONValue as? [String: Any],
              let dictionaryEncoded = try? JSONSerialization.data(withJSONObject: experimentDictionary) else {
            return nil
        }

        do {
            return try decoder.decode(T.self, from: dictionaryEncoded)
        } catch {
            return nil
        }
    }
}

// MARK: - ConfigBridge for `Collection`

public final class ConfigArrayBridge<T: Collection>: ConfigBridge<T> {
    
    /** Save the `Collection` value in the default store */
    public override func save(key: String, value: T?, defaultsStore: DefaultsStore) {
        defaultsStore[key] = value.flatMap { try? JSONSerialization.data(withJSONObject: $0, options: []) }
    }

    /**
     Gets the `Collection` value asked for the given key. Check and take value in this order:
     1. Amplitude Experiment
     2. Remote Config
     */
    public override func get(key: String, remoteConfig: RemoteConfig, experimentVariants: [String: Any]) -> T? {
        return experimentDeserialize(for: key, from: experimentVariants) ??
            remoteConfigDeserialize(remoteConfig[key].dataValue) ??
            remoteConfig[key].stringValue?.data(using: .utf8).flatMap(remoteConfigDeserialize)
    }

    /** Gets the `Collection` value from the default store */
    public override func get(key: String, defaultsStore: DefaultsStore) -> T? {
        return (defaultsStore[key] as? Data).flatMap(remoteConfigDeserialize)
    }

    /** Deserialize a Remote Config value into a `Collection` object */
    func remoteConfigDeserialize(_ data: Data) -> T? {
        return (try? JSONSerialization.jsonObject(with: data, options: [])).flatMap { $0 as? T }
    }
    
    /** Deserialize an Amplitude Experiment value into a `Collection` object */
    func experimentDeserialize(for key: String, from experimentVariants: [String: Any]) -> T? {
        guard let array = experimentVariants[key] as? [Any],
           let nonCodableArray = array.compactMap({ $0 as? T.Element }) as? T else {
            return nil
        }
        
        return nonCodableArray
    }
}

// MARK: - ConfigBridge for `Array` if `Collection.Element` is `RawRepresentable` (for Enum element).

public final class ConfigRawRepresentableArrayBridge<T: Collection>: ConfigBridge<T> where T.Element: RawRepresentable {
    
    /** Save the `[RawRepresentable]` value in the default store */
    public override func save(key: String, value: T?, defaultsStore: DefaultsStore) {
        defaultsStore[key] = value
            .flatMap { try? JSONSerialization.data(withJSONObject: $0.compactMap { $0.rawValue }, options: []) }
    }

    /**
     Gets the `[RawRepresentable]` value asked for the given key. Check and take value in this order:
     1. Amplitude Experiment
     2. Remote Config
     */
    public override func get(key: String, remoteConfig: RemoteConfig, experimentVariants: [String: Any]) -> T? {
        let experimentDeserialized = (experimentVariants[key] as? [T.Element.RawValue])?
            .compactMap({ T.Element(rawValue: $0) }) as? T
        
        let remoteConfigDeserialized = (remoteConfigDeserialize(remoteConfig[key].dataValue) ??
                                        remoteConfig[key].stringValue?.data(using: .utf8).flatMap(remoteConfigDeserialize))?
            .compactMap(T.Element.init(rawValue:)) as? T
        
        return experimentDeserialized ?? remoteConfigDeserialized
    }

    /** Gets the `[RawRepresentable]` value from the default store */
    public override func get(key: String, defaultsStore: DefaultsStore) -> T? {
        return (defaultsStore[key] as? Data).flatMap(remoteConfigDeserialize).flatMap { $0.compactMap(T.Element.init(rawValue:)) } as? T
    }

    /** Deserialize a Remote Config value into a `[RawRepresentable]` object */
    func remoteConfigDeserialize(_ data: Data) -> [T.Element.RawValue]? {
        return (try? JSONSerialization.jsonObject(with: data, options: [])).flatMap { $0 as? [T.Element.RawValue] }
    }
}
