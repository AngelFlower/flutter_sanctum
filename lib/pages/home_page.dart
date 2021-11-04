import 'package:flutter/material.dart';

import 'package:flutter_sanctum/widgets/nav_drawer.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sanctum authentication'),
      ),
      drawer: NavDrawer(),
      body: Center(
        child: Text('You are not logged in'),
      ),
    );
  }
}
