import 'package:hive/hive.dart';

import '../models/user.dart';

class LocalDBService {
  // User Related
  final userBox = Hive.box<User>('userBox');
  void storeUser(User user) => userBox.add(user);
  void replaceUser(User user) => userBox.putAt(0, user);
  User? getUser() => userBox.getAt(0);
  void removeUser() => userBox.clear();

  // Token Related
  final tokenBox = Hive.box<String>('tokenBox');
  void storeToken(String token) => tokenBox.add(token);
  String? getToken() => tokenBox.getAt(0);
  void removeToken() => tokenBox.clear();
}
