import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller.dart';

final controller = Get.put(LoginController());
final usernameController = TextEditingController();
final passwordController = TextEditingController();

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 4,
        title: const Text('Login'),
        shadowColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            TextField(
              controller: usernameController,
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                labelText: 'Username',
                labelStyle: TextStyle(color: Colors.blue),
                enabledBorder: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: passwordController,
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                  labelStyle: TextStyle(color: Colors.blue),
                  labelText: 'Password',
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder()),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            Obx(() => controller.isLoading.value
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () => controller.login(
                      usernameController.text,
                      passwordController.text,
                    ),
                    child: const Text('Login'),
                  )),
          ],
        ),
      ),
    );
  }
}
