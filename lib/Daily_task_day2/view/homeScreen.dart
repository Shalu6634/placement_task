import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper/storage_helper.dart';

class HomeScreen extends StatelessWidget {
  Future<Map<String, dynamic>> getUserDetails() async {
    return await StorageHelper.getUserDetails() ?? {};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await StorageHelper.clearUserDetails();
              Get.offAllNamed('/login');
            },
          ),
        ],
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: getUserDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          final user = snapshot.data!;
          return ListView(
            children: [
              ListTile(
                title: Text(user['firstName']),
                subtitle: Text(user['email']),
                onTap: () => Get.toNamed('/details', arguments: user),
              ),
            ],
          );
        },
      ),
    );
  }
}