import 'package:flutter/material.dart';
import 'package:flutter_sanctum/providers/auth.dart';

import 'package:flutter_sanctum/widgets/nav_drawer.dart';
import 'package:provider/provider.dart';

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
        child: Consumer<Auth>(
          builder: (context, auth, child) {
            if (auth.isAuth) {
              return Text('Yo are logged in');
            }
            return Text('You are not logged in');
          },
        ),
      ),
    );
  }
}
