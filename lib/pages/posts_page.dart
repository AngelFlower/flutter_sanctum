import 'package:flutter/material.dart';

class PostsPage extends StatefulWidget {
  PostsPage({Key? key}) : super(key: key);

  @override
  _PostsPageState createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: Center(
        child: Text('Posts'),
      ),
    );
  }
}
