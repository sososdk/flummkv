import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/services.dart';

/// Wraps MMKV on iOS) and  Android, providing
/// a persistent store for simple data.
class Flummkv {
  static const MethodChannel _channel =
      const MethodChannel('com.github.sososdk/flummkv');
  static const String ID = "id";
  static const String CRYPT = "crypt";
  static const String KEY = "key";
  static const String VALUE = "value";

  Flummkv._();

  /// Reads a value from persistent storage, throwing an exception if it's not a bool.
  static Future<bool> getBool(
    String key, {
    String id,
    String crypt,
  }) {
    final Map<String, dynamic> params = {
      ID: id,
      CRYPT: crypt,
      KEY: key,
    };
    return _channel.invokeMethod('getBool', params);
  }

  /// Reads a value from persistent storage, throwing an exception if it's not an int.
  static Future<int> getInt(
    String key, {
    String id,
    String crypt,
  }) {
    final Map<String, dynamic> params = {
      ID: id,
      CRYPT: crypt,
      KEY: key,
    };
    return _channel.invokeMethod('getInt', params);
  }

  /// Reads a value from persistent storage, throwing an exception if it's not a double.
  static Future<double> getDouble(
    String key, {
    String id,
    String crypt,
  }) {
    final Map<String, dynamic> params = {
      ID: id,
      CRYPT: crypt,
      KEY: key,
    };
    return _channel.invokeMethod('getDouble', params);
  }

  /// Reads a value from persistent storage, throwing an exception if it's not a string.
  static Future<String> getString(
    String key, {
    String id,
    String crypt,
  }) {
    final Map<String, dynamic> params = {
      ID: id,
      CRYPT: crypt,
      KEY: key,
    };
    return _channel.invokeMethod('getString', params);
  }

  /// Reads a value from persistent storage, throwing an exception if it's not a `Uint8List`.
  static Future<Uint8List> getUint8List(
    String key, {
    String id,
    String crypt,
  }) {
    final Map<String, dynamic> params = {
      ID: id,
      CRYPT: crypt,
      KEY: key,
    };
    return _channel.invokeMethod('getBytes', params);
  }

  /// Saves a boolean [value] to persistent storage in the background.
  ///
  /// If [value] is null, this is equivalent to calling [removeByKey()] on the [key].
  static Future<bool> setBool(
    String key,
    bool value, {
    String id,
    String crypt,
  }) =>
      _setValue('Bool', id, crypt, key, value);

  /// Saves an integer [value] to persistent storage in the background.
  ///
  /// If [value] is null, this is equivalent to calling [removeByKey()] on the [key].
  static Future<bool> setInt(
    String key,
    int value, {
    String id,
    String crypt,
  }) =>
      _setValue('Int', id, crypt, key, value);

  /// Saves a double [value] to persistent storage in the background.
  ///
  /// If [value] is null, this is equivalent to calling [removeByKey()] on the [key].
  static Future<bool> setDouble(
    String key,
    double value, {
    String id,
    String crypt,
  }) =>
      _setValue('Double', id, crypt, key, value);

  /// Saves a string [value] to persistent storage in the background.
  ///
  /// If [value] is null, this is equivalent to calling [removeByKey()] on the [key].
  static Future<bool> setString(
    String key,
    String value, {
    String id,
    String crypt,
  }) =>
      _setValue('String', id, crypt, key, value);

  /// Saves a `Uint8List` [value] to persistent storage in the background.
  ///
  /// If [value] is null, this is equivalent to calling [removeByKey()] on the [key].
  static Future<bool> setUint8List(
    String key,
    Uint8List value, {
    String id,
    String crypt,
  }) =>
      _setValue('Bytes', id, crypt, key, value);

  static Future<bool> _setValue(
    String valueType,
    String id,
    String crypt,
    String key,
    Object value,
  ) {
    final Map<String, dynamic> params = {
      ID: id,
      CRYPT: crypt,
      KEY: key,
    };
    if (value == null) {
      return _channel.invokeMethod('removeByKey', params);
    } else {
      params[VALUE] = value;
      return _channel.invokeMethod('set$valueType', params);
    }
  }

  /// Removes an entry from persistent storage.
  static Future<bool> removeByKey(
    String key, {
    String id,
    String crypt,
  }) =>
      _setValue(null, id, crypt, key, null);

  /// `True` if the [key] contains.
  static Future<bool> contains(
    String key, {
    String id,
    String crypt,
  }) {
    final Map<String, dynamic> params = {
      ID: id,
      CRYPT: crypt,
      KEY: key,
    };
    return _channel.invokeMethod('contains', params);
  }

  /// Android only.
  static Future<int> getValueSize(
    String key, {
    String id,
    String crypt,
  }) {
    final Map<String, dynamic> params = {
      ID: id,
      CRYPT: crypt,
      KEY: key,
    };
    return _channel.invokeMethod('getValueSize', params);
  }

  /// Completes with true once the user preferences for the app has been cleared.
  static Future<bool> clear({
    String id,
    String crypt,
  }) {
    final Map<String, dynamic> params = {
      ID: id,
      CRYPT: crypt,
    };
    return _channel.invokeMethod('clear', params);
  }

  /// Get item count.
  static Future<int> count({
    String id,
    String crypt,
  }) {
    final Map<String, dynamic> params = {
      ID: id,
      CRYPT: crypt,
    };
    return _channel.invokeMethod('count', params);
  }

  /// Get all keys.
  static Future<List<String>> allKeys({
    String id,
    String crypt,
  }) {
    final Map<String, dynamic> params = {
      ID: id,
      CRYPT: crypt,
    };
    return _channel.invokeMethod<List>('allKeys', params).then((value) {
      return Future.value(value?.map((_) => _ as String)?.toList());
    });
  }

  /// Get storage file size.
  static Future<int> totalSize({
    String id,
    String crypt,
  }) {
    final Map<String, dynamic> params = {
      ID: id,
      CRYPT: crypt,
    };
    return _channel.invokeMethod('totalSize', params);
  }

  /// Android only.
  static Future<int> pageSize() {
    return _channel.invokeMethod('pageSize', {});
  }
}

class Mmkv {
  final String id;

  /// cryptKey's length <= 16
  final String crypt;

  Mmkv({this.id, this.crypt});

  /// Reads a value from persistent storage, throwing an exception if it's not a bool.
  Future<bool> getBool(String key) {
    return Flummkv.getBool(key, id: id, crypt: crypt);
  }

  /// Reads a value from persistent storage, throwing an exception if it's not an int.
  Future<int> getInt(String key) {
    return Flummkv.getInt(key, id: id, crypt: crypt);
  }

  /// Reads a value from persistent storage, throwing an exception if it's not a double.
  Future<double> getDouble(String key) {
    return Flummkv.getDouble(key, id: id, crypt: crypt);
  }

  /// Reads a value from persistent storage, throwing an exception if it's not a string.
  Future<String> getString(String key) {
    return Flummkv.getString(key, id: id, crypt: crypt);
  }

  /// Reads a value from persistent storage, throwing an exception if it's not a `Uint8List`.
  Future<Uint8List> getUint8List(String key) {
    return Flummkv.getUint8List(key, id: id, crypt: crypt);
  }

  /// Saves a boolean [value] to persistent storage in the background.
  ///
  /// If [value] is null, this is equivalent to calling [removeByKey()] on the [key].
  Future<bool> setBool(String key, bool value) =>
      Flummkv.setBool(key, value, id: id, crypt: crypt);

  /// Saves an integer [value] to persistent storage in the background.
  ///
  /// If [value] is null, this is equivalent to calling [removeByKey()] on the [key].
  Future<bool> setInt(String key, int value) =>
      Flummkv.setInt(key, value, id: id, crypt: crypt);

  /// Saves a double [value] to persistent storage in the background.
  ///
  /// If [value] is null, this is equivalent to calling [removeByKey()] on the [key].
  Future<bool> setDouble(String key, double value) =>
      Flummkv.setDouble(key, value, id: id, crypt: crypt);

  /// Saves a string [value] to persistent storage in the background.
  ///
  /// If [value] is null, this is equivalent to calling [removeByKey()] on the [key].
  Future<bool> setString(String key, String value) =>
      Flummkv.setString(key, value, id: id, crypt: crypt);

  /// Saves a `Uint8List` [value] to persistent storage in the background.
  ///
  /// If [value] is null, this is equivalent to calling [removeByKey()] on the [key].
  Future<bool> setUint8List(String key, Uint8List value) =>
      Flummkv.setUint8List(key, value, id: id, crypt: crypt);

  /// Removes an entry from persistent storage.
  Future<bool> removeByKey(String key) =>
      Flummkv.removeByKey(key, id: id, crypt: crypt);

  /// `True` if the [key] contains.
  Future<bool> contains(String key) =>
      Flummkv.contains(key, id: id, crypt: crypt);

  /// Android only.
  Future<int> getValueSize(String key) =>
      Flummkv.getValueSize(key, id: id, crypt: crypt);

  Future<bool> clear() => Flummkv.clear(id: id, crypt: crypt);

  Future<int> count() => Flummkv.count(id: id, crypt: crypt);

  /// Get all keys.
  Future<List<String>> allKeys() => Flummkv.allKeys(id: id, crypt: crypt);

  Future<int> totalSize() => Flummkv.totalSize(id: id, crypt: crypt);
}
