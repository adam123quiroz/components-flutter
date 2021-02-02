import 'dart:convert';

import 'package:http/http.dart' as http;

class _MenuProvider {
  List<dynamic> options = [];

  _MenuProvider();

  Future<User> fetchUser() async {
    final response =
        await http.get('https://jsonplaceholder.typicode.com/users/1');
    if (response.statusCode == 200) {
      return Future(() => User.fromJson(jsonDecode(response.body)));
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<List<User>> fetchUsers() async {
    final response =
        await http.get('https://jsonplaceholder.typicode.com/users');
    if (response.statusCode == 200) {
      return Future(() => User.fromJsonList(jsonDecode(response.body)));
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<List<User>> loadData() async {
    options = await fetchUsers();
    return options;
  }
}

class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final String phone;
  final String website;

  User({
    this.id,
    this.name,
    this.username,
    this.email,
    this.phone,
    this.website,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      website: json['website'],
    );
  }

  static fromJsonList(List<dynamic> json) {
    List<User> list = new List();
    for (var i in json) {
      list.add(User(
        id: i['id'],
        name: i['name'],
        username: i['username'],
        email: i['email'],
        phone: i['phone'],
        website: i['website'],
      ));
    }
    return list;
  }

  @override
  String toString() {
    return 'User{id: $id, name: $name, username: $username, email: $email, phone: $phone, website: $website}';
  }
}

final menuProvider = new _MenuProvider();
