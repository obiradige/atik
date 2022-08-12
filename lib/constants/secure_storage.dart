import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final _storage = const FlutterSecureStorage();

  Future<bool> isKeyStored(String key) async {
    final value = await _storage.read(key: key);
    return value != null;
  }

  Future<String?> findKey(String key) async {
    final value = await _storage.read(key: key);
    return value;
  }

  Future<void> storeKey({required String key, required String value}) async {
    await _storage.write(key: key, value: value);
  }

  Future<void> deleteKey(String key) async {
    await _storage.delete(key: key);
  }

  Future<void> deleteAll() async {
    await _storage.deleteAll();
  }
}
