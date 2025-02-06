import 'dart:convert';

import 'package:multiselect_formfield/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

final diContainer = DIContainer();

class DIContainer {
  late final List<User> users;

  DIContainer();

  Future<void> init() async {
    await initUsers();
  }

  Future<void> initUsers() async {
    final SharedPreferences _storage = await SharedPreferences.getInstance();
    List<String>? data = _storage.getStringList('USERS');// (_storage.getStringList('USERS')??[]).map((e)=> json.decode(e)).toList();
    if (data == null) {
      users = [
        User(id: '0', title: 'Ivan', email: 'ivan@google.com', role: 'admin'),
        User(
            id: '1', title: 'Kolyan', email: 'kolyan@google.com', role: 'user'),
        User(
            id: '2', title: 'Sergey', email: 'sergey@google.com', role: 'user'),
        User(
            id: '3', title: 'Maksim', email: 'maksim@google.com', role: 'user'),
        User(id: '4', title: 'Sveta', email: 'sveta@google.com', role: 'user'),
      ];
      await _storage.setStringList('USERS', Users(users: users).toStringList());
    } else {
      users = Users.fromList(data.map((e)=> json.decode(e)).toList()).users;
    }
  }
}
