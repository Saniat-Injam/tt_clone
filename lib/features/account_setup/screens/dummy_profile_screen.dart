import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tt_clone/features/account_setup/controller/country_picker_controller.dart';

class DummyProfileScreen extends StatelessWidget {
  DummyProfileScreen({super.key});

  final CountryPickerController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Center(
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                controller.selectedCountry.isNotEmpty
                    ? 'Selected Country: ${controller.selectedCountry.value}'
                    : 'No country selected',
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                controller.selectedFlag.isNotEmpty
                    ? controller.selectedFlag.value
                    : '🌍',
                style: const TextStyle(fontSize: 50),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
