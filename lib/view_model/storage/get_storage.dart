import 'package:get_storage/get_storage.dart';

class StorageUtil {
  static final _box = GetStorage();

  static bool hasData(String key) {
    return _box.hasData(key);
  }

  static void insertData(String key, dynamic value) async {
    await _box.write(key, value);
  }

  static dynamic readData(String key) {
    return _box.read(key);
  }

  static void removeData(String key) async {
    await _box.remove(key);
  }

  static void clearAllData() async {
    await _box.erase();
  }
}
