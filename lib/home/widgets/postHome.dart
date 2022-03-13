import 'package:flutter/material.dart';
import 'package:reddit_hot_funny/constants/colors.dart';
import 'package:reddit_hot_funny/constants/font.dart';
import 'package:reddit_hot_funny/models/postmodel.dart';
import 'package:url_launcher/url_launcher.dart';

class PostHome extends StatelessWidget {
  final Post post;

  const PostHome({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Click the picture to see it on reddit..",style: KalinYazi.bold,),
        Align(
          alignment: Alignment.center,
          child: InkWell(
            onTap: () {
              launch("https://www.reddit.com${post.permalink}");
            },
            child: SizedBox(
              width: 200,
              height: 200,
              child: Image.network(post.thumbnail.toString()),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Card(
              child: Text(
                post.author.toString(),
                style: KalinYazi.bold,
              ),
            ),
            Card(
              child: Text(
                post.score.toString(),
                style: KalinYazi.bold,
              ),
            ),
            Card(
              child: Text(
                post.date.toString(),
                style: KalinYazi.bold,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Expanded(
              child: Center(
                  child: Card(
                    child: Text(
                post.title.toString(),
                style: KalinYazi.bold,
              ),
                  )),
            ),
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Card(
                elevation: 5,
                child: Text(
                  post.num_comments.toString(),
                  style: KalinYazi.bold,
                )),
            Card(
                elevation: 5,
                child: Text(
                  post.score.toString(),
                  style: KalinYazi.bold,
                )),
          ],
        )
      ],
    );
  }
}
