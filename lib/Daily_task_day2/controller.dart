

import 'package:get/get.dart';
import 'package:placement_task/Daily_task_day2/helper/storage_helper.dart';

class ApiConstants
{
  static const String baseUrl = 'https://dummyjson.com';
  static const String loginEndpoint  = '/auth/login';
  static const String usersEndpoint   = '/users';
}

class LoginController extends GetxController
{
  RxBool isLoad = false.obs;
  List userList = [];
  Future<void> loginUser(String username,String password)
  async {
    isLoad = false.obs;
     final userList =  await AuthServices.authServices.login(username, password);

  }

}