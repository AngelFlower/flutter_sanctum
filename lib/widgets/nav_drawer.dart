import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      color: Colors.white,
      child: ListView(
        children: [
          ListTile(
            title: Text('Alex Garret-Smith'),
          ),
          ListTile(
            title: Text('Posts'),
            onTap: () {
              Navigator.pushNamed(context, 'posts');
            },
          ),
          ListTile(
            title: Text('Login'),
            onTap: () {
              Navigator.pushNamed(context, 'login');
            },
          )
        ],
      ),
    );
  }
}
