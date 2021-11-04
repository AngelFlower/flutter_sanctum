import 'package:flutter/material.dart';

import 'dart:developer';

import 'package:flutter_sanctum/providers/auth.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';

  Future submit() async {
    Provider.of<Auth>(context, listen: false)
        .login(credentials: {'email': _email, 'password': _password});

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Form(
            key: _formKey,
            child: Scrollbar(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    TextFormField(
                      initialValue: 'alex@codecourse.com',
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'you@somewhere.com',
                      ),
                      onSaved: (value) {
                        _email = value!;
                      },
                    ),
                    TextFormField(
                      initialValue: 'password',
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: '********',
                      ),
                      obscureText: true,
                      onSaved: (value) {
                        _password = value!;
                      },
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          _formKey.currentState!.save();
                          this.submit();
                        },
                        child: Text('Login'),
                      ),
                    ),
                  ],
                ),
              ),
            )));
  }
}
