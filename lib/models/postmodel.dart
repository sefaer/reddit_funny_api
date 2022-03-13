import 'dart:convert';

import 'package:intl/intl.dart';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
  Post(
      {this.thumbnail,
        this.author,
        this.score,
        this.date,
        this.title,
        this.num_comments,
        this.permalink});

  String? thumbnail;
  String? author;
  int? score;
  String? date;
  String? title;
  int? num_comments;
  String? permalink;
  //String? goldmedals;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
    thumbnail: json["data"]["thumbnail"].toString().contains(".com")
        ? json["data"]["thumbnail"]
        : "https://hayateli.com/wp-content/uploads/2021/05/alert-icon-5807a14f5f9b5805c2aa679c-1024x683.png",
    author: json["data"]["author"] ?? "ben",
    score: json["data"]["score"] ?? 5,
    date: json["data"]["start_date"] ?? formattedDate,
    title: json["data"]["title"] ?? "this title",
    num_comments: json["data"]["num_comments"] ?? 5,
    permalink:json["data"]["permalink"]??"null",
  );

  Map<String, dynamic> toJson() => {
    "thumbnail": thumbnail,
    "author": author,
    "score": score,
    "start_date": date,
    "title": title,
    "comments": num_comments,
    "permalink":permalink,
  };
}
DateTime now = DateTime.now();
String formattedDate = DateFormat('yyyy-MM-dd').format(now);