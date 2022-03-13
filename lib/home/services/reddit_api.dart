import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:reddit_hot_funny/constants/constants.dart';
import 'package:reddit_hot_funny/models/postmodel.dart';

class RedditApi {
  static Future<List<Post>> fetchAllPosts() async {
    List<Post> _list = [];
    final response = await http.get(Uri.parse(Constants.url));
    var dataDecoded = jsonDecode(response.body);
    var results = dataDecoded['data']['children'];

    if (results is List) {
      _list.addAll(results.map((e) => Post.fromJson(e)).toList());
    }
    return _list;
  }
}
