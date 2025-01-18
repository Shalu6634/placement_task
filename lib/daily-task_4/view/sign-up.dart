import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:placement_task/daily-task_4/view/sign-in.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          'Sign-Up',
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
              controller: txtName,
              decoration: const InputDecoration(
                labelText: 'Name',
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: txtPhone,
              decoration: const InputDecoration(
                labelText: 'Phone',
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: txtEmail,
              decoration: const InputDecoration(
                labelText: 'Email',
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: txtAddress,
              decoration: const InputDecoration(
                labelText: 'Address',
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
              child: const Text('Sign-Up',style: TextStyle(color: Colors.white),),
              onPressed: () {
              },
            )
          ],
        ),
      ),
    );
  }
}
