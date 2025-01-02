import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Get.arguments;

    return Scaffold(
      appBar: AppBar(title: Text('${user['firstName']} Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${user['firstName']} ${user['lastName']}'),
            Text('Email: ${user['email']}'),
            Text('Phone: ${user['phone']}'),
          ],
        ),
      ),
    );
  }
}