import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

TextEditingController txtName = TextEditingController();
TextEditingController txtEmail = TextEditingController();
TextEditingController txtPass = TextEditingController();
TextEditingController txtPhone = TextEditingController();
TextEditingController txtAddress = TextEditingController();

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          'Sign-In',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: txtEmail,
              decoration: const InputDecoration(
                labelText: 'Email',
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: txtPass,
              decoration: const InputDecoration(
                labelText: 'Password',
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
              ),
            ),

            CupertinoButton(
              sizeStyle: CupertinoButtonSize.large,
              color: Colors.black,
              child: const Text('Sign-In',style: TextStyle(color: Colors.white),),
              onPressed: () {

              },
            )
          ],
        ),
      ),
    );
  }
}
