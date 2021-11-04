import 'package:flutter/material.dart';

import 'dart:developer';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';

  void submit() {
    log(_email);
    log(_password);
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
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'you@somewhere.com',
                      ),
                      onSaved: (value) {
                        _email = value!;
                      },
                    ),
                    TextFormField(
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
