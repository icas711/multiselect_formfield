import 'dart:convert';

class User {
  final String id;
  final String title;
  final String email;
  final String role;

  const User({
    required this.id,
    required this.title,
    required this.email,
    required this.role,
  });

  factory User.init() {
    return const User(
      id: '',
      title: '',
      email: '',
      role: '',
    );
  }

  @override
  String toString() {
    return title;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'email': email,
      'role': role,
    };
  }

  factory User.fromJson(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      title: map['title'] as String,
      email: map['email'] as String,
      role: map['role'] as String,
    );
  }

  User copyWith({
    String? id,
    String? title,
    String? email,
    String? role,
  }) {
    return User(
      id: id ?? this.id,
      title: title ?? this.title,
      email: email ?? this.email,
      role: role ?? this.role,
    );
  }
}

class Users {
  final List<User> users;

  const Users({required this.users});

  factory Users.fromList(List list) =>
      Users(users: list.map((user) => User.fromJson(user)).toList());

  List<String> toStringList(){
    return users.map((e)=>json.encode(e.toJson())).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'users': users,
    };
  }

  factory Users.fromJson(Map<String, dynamic> map) {
    return Users(
      users: map['users'] as List<User>,
    );
  }
}
