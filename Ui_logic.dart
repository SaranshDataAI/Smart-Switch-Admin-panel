import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeController extends GetxController {
  final phoneController = TextEditingController();
  final deviceData = "".obs;
  final currentVersion = "v1.0.0".obs;
  final latestVersion = "v1.2.3"; // Mock latest version

  @override
  void onInit() {
    super.onInit();
    _anonymousSignIn();
  }

  Future<void> _anonymousSignIn() async {
    try {
      await FirebaseAuth.instance.signInAnonymously();
      print("Signed in anonymously");
    } catch (e) {
      print("Anonymous sign-in failed: $e");
    }
  }

  void fetchCustomerData() {
    final number = phoneController.text;
    if (number.isEmpty) {
      Get.snackbar("Error", "Please enter a number");
      return;
    }

    // Mocked data fetch
    deviceData.value = "Smart Plug | Version: ${currentVersion.value}";
  }

  void updateToLatestVersion() {
    if (currentVersion.value != latestVersion) {
      currentVersion.value = latestVersion;
      Get.snackbar("Update", "Device updated to $latestVersion");
      deviceData.value = "Smart Plug | Version: ${currentVersion.value}";
    } else {
      Get.snackbar("Info", "Device is already on the latest version");
    }
  }
}
