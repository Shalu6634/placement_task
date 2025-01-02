import 'package:get/get.dart';
import 'package:placement_task/Daily_task_day2/service/storage_service.dart';

import 'helper/storage_helper.dart';

class LoginController extends GetxController {
  final AuthService _authService = AuthService();
  var isLoading = false.obs;

  Future<void> login(String username, String password) async {
    isLoading.value = true;
    try {
      final user = await _authService.login(username, password);
      await StorageHelper.saveUserDetails(user);
      Get.offNamed('/home');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}