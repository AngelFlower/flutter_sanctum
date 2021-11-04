import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_sanctum/models/post.dart';
import 'package:dio/dio.dart' as Dio;
import '../utils/dio.dart';

import 'dart:convert';

class PostsPage extends StatefulWidget {
  PostsPage({Key? key}) : super(key: key);

  @override
  _PostsPageState createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  Future<List<Post>> getPosts() async {
    Dio.Response response = await dio()
        .get('user/posts', options: Dio.Options(headers: {'auth': true}));
    List posts = json.decode(response.toString());
    return posts.map((post) => Post.fromJson(post)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: Center(
          child: FutureBuilder<List<Post>>(
        future: getPosts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (contex, index) {
                var item = snapshot.data![index];

                return ListTile(
                  title: Text(item.title),
                );
              },
            );
          } else if (snapshot.hasError) {
            log('error');
            log(snapshot.error.toString());
            return Text('Failed to load posts');
          }
          //log(snapshot.data.toString());

          return CircularProgressIndicator();
        },
      )),
    );
  }
}
