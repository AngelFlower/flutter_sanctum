import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_sanctum/providers/auth.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Consumer<Auth>(
        builder: (context, auth, child) {
          if (auth.isAuth) {
            return ListView(
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
                  title: Text('Logout'),
                  onTap: () {},
                )
              ],
            );
          }
          return ListView(
            children: [
              ListTile(
                title: Text('Login'),
                onTap: () {
                  Navigator.pushNamed(context, 'login');
                },
              ),
              ListTile(
                title: Text('Register'),
                onTap: () {
                  Navigator.pushNamed(context, 'register');
                },
              )
            ],
          );
        },
      ),
    );
  }
}
