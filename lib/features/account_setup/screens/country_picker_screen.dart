// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:tt_clone/features/account_setup/controller/country_picker_controller.dart';

// class CountryPickerScreen extends StatelessWidget {
//   CountryPickerScreen({super.key});

//   final CountryPickerController controller = Get.put(CountryPickerController());

//   @override
//   Widget build(BuildContext context) {
//     // Show the picker immediately after navigation
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       controller.showCountryPickerDialog(context);
//     });

//     return Scaffold(
//       appBar: AppBar(title: const Text('Select Country')),
//       body: Center(
//         child: Obx(
//           () => Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 controller.selectedCountry.isEmpty
//                     ? 'No country selected yet'
//                     : controller.selectedCountry.value,
//                 style: const TextStyle(fontSize: 18),
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () => controller.showCountryPickerDialog(context),
//                 child: const Text('Select Country'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tt_clone/features/account_setup/controller/country_picker_controller.dart';

class CountryPickerScreen extends StatelessWidget {
  CountryPickerScreen({super.key});

  final CountryPickerController controller = Get.put(CountryPickerController());

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.showCountryPickerDialog(context);
    });

    return Scaffold(
      appBar: AppBar(title: const Text('Select Country')),
      body: Center(
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                controller.selectedCountry.isEmpty
                    ? 'No country selected yet'
                    : controller.selectedCountry.value,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => controller.showCountryPickerDialog(context),
                child: const Text('Select Country'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
