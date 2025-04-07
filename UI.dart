import 'package:app1/CommonColors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/home_controller.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Smart Switch Admin Panel"),
        backgroundColor: CommonColors.colorPrimaryDark,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Obx(() {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Enter Registered Customer Number"),
              TextField(
                controller: controller.phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(hintText: "Enter Number"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: controller.fetchCustomerData,
                child: const Text("Fetch Customer Data"),
              ),
              const SizedBox(height: 20),
              if (controller.deviceData.isNotEmpty) ...[
                Text("Device Info: ${controller.deviceData}"),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: controller.updateToLatestVersion,
                  child: const Text("Update to Latest Version"),
                )
              ],
            ],
          );
        }),
      ),
    );
  }
}
