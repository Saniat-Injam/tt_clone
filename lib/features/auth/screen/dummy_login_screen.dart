import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tt_clone/features/account_setup/controller/country_picker_controller.dart';
import 'package:tt_clone/features/account_setup/widgets/country+picker_screen.dart';

class DummyLoginScreen extends StatelessWidget {
  DummyLoginScreen({super.key});

  final CountryPickerController countryController = Get.put(
    CountryPickerController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Get.to(() => const CountryPickerScreen()),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
          ),
          child: const Text(
            'Login',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
