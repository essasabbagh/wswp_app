import 'package:get_storage/get_storage.dart';

const String tokenKey = 'token';

class StorageService {
  final GetStorage box;

  StorageService(this.box);

  String read(String key) => box.read<String>(key) ?? '';
  Future<void> write(String key, dynamic value) async => await box.write(key, value);
  Future<void> remove(String key) async => await box.remove(key);
  Future<void> clear() async => await box.erase();

  // Token Storage
  String getToken() => read(tokenKey);
  Future<void> saveToken(String token) => write(tokenKey, token);
  Future<void> deleteToken() => remove(tokenKey);
}
