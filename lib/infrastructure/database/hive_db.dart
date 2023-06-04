// ignore_for_file: depend_on_referenced_packages

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import '../../application/models/user.dart';

class HiveDB {
  static Future init() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();

    Hive.init(appDocumentDir.path);

    Hive.registerAdapter(UserAdapter());

    await Hive.openBox<User>('userBox');
    await Hive.openBox<String>('tokenBox');
  }
}
