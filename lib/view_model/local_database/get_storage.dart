import 'package:get_storage/get_storage.dart';

class StorageUtil {
  static final _box = GetStorage();

  bool hasData(String key) {
    return _box.hasData(key);
  }

  void insertData(String key, dynamic value) async {
    await _box.write(key, value);
  }

  dynamic readData(String key) {
    return _box.read(key);
  }

  void removeData(String key) async {
    await _box.remove(key);
  }

  void clearAllData() async {
    await _box.erase();
  }
}
