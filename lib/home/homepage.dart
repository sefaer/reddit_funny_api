import 'package:flutter/material.dart';
import 'package:reddit_hot_funny/home/services/reddit_api.dart';
import 'package:reddit_hot_funny/home/widgets/postHome.dart';
import 'package:reddit_hot_funny/models/postmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //bool state = false;
  //String a = "";
  late Future<List<Post>> _postListFuture;

  //List<Post> postList = [];

  /* Future<String> getApi() async {
    final response =
        await http.get(Uri.parse("https://api.reddit.com/r/funny/hot.json"));
    var dataDecoded = jsonDecode(response.body);
    var results = dataDecoded['data']['children'];
    print(results);
    setState(() {
      state = true;
    });

    return results.toString();

    /*for (var item in results) {
      print(item['data']['subreddit']);
    }*/
  }*/

  /* void methodstring() async {
    if (state == true) {
      a = await getApi();
    }
  }*/

  /*void getApi2() async {
    postList = await RedditApi.fetchAllPosts();
    setState(() {
      state = true;
    });
  }
*/
  @override
  void initState() {
    _postListFuture = RedditApi.fetchAllPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              "Reddit r/funny Hot Post",
              style: TextStyle(color: Colors.black54),
            ),
          ),
          backgroundColor: Colors.white70,
        ),
        body: Container(color: Colors.white70,
          child: SafeArea(
              child: FutureBuilder<List<Post>>(
                  future: _postListFuture,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Post> myList = snapshot.data!;
                      return ListView.builder(
                        itemCount: myList.length,
                        itemBuilder: (context, index) {
                          var currentPost = myList[index];
                          return PostHome(post: currentPost);
                        },
                      );
                    } else if (snapshot.hasError) {
                      print(snapshot.error);
                      return const Center(
                        child: Text("error"),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(
                          value: 200,
                        ),
                      );
                    }
                  })),
        ));
  }
}
