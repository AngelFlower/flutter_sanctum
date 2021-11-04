import 'package:flutter/material.dart';

import 'package:flutter_sanctum/pages/home_page.dart';
import 'package:flutter_sanctum/pages/posts_page.dart';
import 'package:flutter_sanctum/pages/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        'posts': (context) => PostsPage(),
        'login': (context) => LoginPage(),
      },
    );
  }
}
