// ignore_for_file: file_names

import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorageService {
  static LocalStorageService? _instance;
  static FlutterSecureStorage? _preferences;
  static const String KEY_LOGIN_PRIVATE = "private_key";
  static const String KEY_LOGIN_TOKENID = "tokenID";
  static Map<String, String> allKeys = Map<String, String>();

  static Future<LocalStorageService> getInstance() async {
    _instance ??= LocalStorageService();
    _preferences ??= const FlutterSecureStorage();
    //execute this only in debug
    // if (!kReleaseMode) {
    // await _preferences?.deleteAll();
    // }

    allKeys.addAll(await _preferences!.readAll());
    return _instance!;
  }

  set setPrivateKey(String privateKey) {
    if (_preferences == null) {
      return;
    }

    _saveToDisk(KEY_LOGIN_PRIVATE, privateKey);
  }

  set setTokenID(String tokenID) {
    if (_preferences == null) {
      return;
    }

    _saveToDisk(KEY_LOGIN_TOKENID, tokenID);
  }

  String getPrivateKey() {
    if (_preferences == null) {
      return "";
    }

    return _getFromDisk(KEY_LOGIN_PRIVATE);
  }

  String getTokenID() {
    if (_preferences == null) {
      return "";
    }

    return _getFromDisk(KEY_LOGIN_TOKENID);
  }

  Future<void> removeAllKeys() => _preferences!.deleteAll();

  dynamic _getFromDisk(String key) {
    if (allKeys.containsKey(key)) return allKeys[key];
    // var value = await _preferences!.read(key: key);
    // print('(TRACE) LocalStorageService:_getFromDisk. key: $key value: $value');
    return "";
  }

  void _saveToDisk<T>(String key, String content) {
    allKeys[key] = content;
    _preferences!.write(key: key, value: content);
    print(
        '(TRACE) LocalStorageService:_saveStringToDisk. key: $key value: $content');
    // if (content is String) {
    //   _preferences!.write(key: key, value: content);
    // } else {
    //   throw UnsupportedError("This data type is not supported!!!");
    // }
    // if (content is bool) {
    //   _preferences.write(key: key, value: content);
    //   _preferences.setBool(key, content);
    // }
    // if (content is int) {
    //   _preferences.setInt(key, content);
    // }
    // if (content is double) {
    //   _preferences.setDouble(key, content);
    // }
    // if (content is List<String>) {
    //   _preferences.setStringList(key, content);
    // }
  }
}
