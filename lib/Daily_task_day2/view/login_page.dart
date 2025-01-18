import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:placement_task/Daily_task_day2/controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
   LoginController controller = Get.put(LoginController());
   TextEditingController userTxt = TextEditingController();
   TextEditingController passTxt = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal,
        elevation: 5,
        shadowColor: Colors.black,
        title: const Text(
          'Login',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white, fontSize: 24),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              TextField(
                controller: userTxt,
                decoration: InputDecoration(
                  labelText: 'username',
                    labelStyle: const TextStyle(color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
              TextField(
                controller: passTxt,
                decoration: InputDecoration(
                  labelText: 'password',
                    labelStyle: const TextStyle(color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5))),
              ),
              const SizedBox(height: 10,),
              CupertinoButton(
                color: Colors.teal,
                child: const Text('Login',style:  TextStyle(color: Colors.white,letterSpacing: 3,fontWeight: FontWeight.bold),),
                onPressed: () {
                  controller.loginUser(userTxt.text, passTxt.text);
                },
              ),
            ],
          ),
          ),
    );
  }
}
