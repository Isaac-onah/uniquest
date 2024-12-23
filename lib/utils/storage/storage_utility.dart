import 'package:get_storage/get_storage.dart';

class TLocalStorage {

  late final GetStorage _storage;

// Singleton instance
  static TLocalStorage? _instance;
  TLocalStorage._internal();

  factory TLocalStorage.instance() {
    _instance ??= TLocalStorage._internal();
    return _instance!;
  }

  static Future<void> init(String bucketName) async {
    await GetStorage.init(bucketName);
    _instance = TLocalStorage._internal();
    _instance!._storage = GetStorage(bucketName);
  }

// Generic method to save data
  Future<void> writeData<T>(String key, T value) async {
    await _storage.write(key, value);
  }

// Generic method to read data
  T? readData<T>(String key) {
    return _storage.read<T>(key);
  }

  //

// Generic method to remove data
  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }
}