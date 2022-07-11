// To parse this JSON data, do
//
//     final posts = postsFromJson(jsonString);

import 'dart:convert';

import 'package:http/http.dart';

List<Posts> postsFromJson(String str) =>
    List<Posts>.from(json.decode(str).map((x) => Posts.fromJson(x)));

String postsToJson(List<Posts> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Posts {
  Posts({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  int userId;
  int id;
  String title;
  String body;

  factory Posts.fromJson(Map<String, dynamic> json) => Posts(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}

class RecivePost {
  Future<List<Posts>> getposts([int startIndex = 0]) async {
    final response =
        await get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    final myposts = postsFromJson(response.body);
    return myposts;
    // if (response.statusCode == 200) {
    //   final body = json.decode(response.body) as List;
    //   return body.map(
    //     (dynamic json) {
    //       return Posts(
    //           userId: json['userId'],
    //           id: json['id'],
    //           title: json['title'],
    //           body: json['body']);
    //     },
    //   ).toList();
    // }
    // throw Exception('UNKNOWN ERROR OCCURED ');
  }
}
