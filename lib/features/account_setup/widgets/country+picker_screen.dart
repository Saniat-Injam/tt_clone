import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tt_clone/features/account_setup/controller/country_picker_controller.dart';
import 'package:tt_clone/features/account_setup/screens/dummy_profile_screen.dart';
import 'package:tt_clone/features/account_setup/screens/profile_setting_screen.dart';

class CountryPickerScreen extends StatelessWidget {
  const CountryPickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CountryPickerController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Country'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // 🔍 Search Bar
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search country',
                  border: OutlineInputBorder(),
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 12,
                  ),
                ),
                onChanged: controller.filterCountries,
              ),
            ),

            // 🌍 Country List (Reactive)
            Expanded(
              child: Obx(() {
                final countries = controller.filteredCountries;
                final selectedCode = controller.selectedCountryCode.value;

                return ListView.separated(
                  itemCount: countries.length,
                  separatorBuilder: (_, __) =>
                      const Divider(height: 1, thickness: 0.5),
                  itemBuilder: (context, index) {
                    final country = countries[index];
                    final isSelected = selectedCode == country.countryCode;

                    return GestureDetector(
                      onTap: () => controller.selectCountry(country),
                      child: Container(
                        decoration: BoxDecoration(
                          color: isSelected
                              ? Colors.blue.withValues(alpha: 0.1)
                              : Colors.transparent,
                          border: Border(
                            left: BorderSide(
                              color: isSelected
                                  ? Colors.blue
                                  : Colors.transparent,
                              width: 3,
                            ),
                            bottom: BorderSide(color: Colors.grey.shade300),
                          ),
                        ),
                        child: ListTile(
                          leading: Text(
                            country.flagEmoji,
                            style: const TextStyle(fontSize: 22),
                          ),
                          title: Text(country.name),
                          subtitle: Text('+${country.phoneCode}'),
                          trailing: Radio<String>(
                            value: country.countryCode,
                            groupValue: selectedCode,
                            onChanged: (_) => controller.selectCountry(country),
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),

            // ✅ Continue Button
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                width: double.infinity,
                child: Obx(
                  () => ElevatedButton(
                    onPressed: controller.selectedCountryCode.value.isEmpty
                        ? null
                        : () => Get.to(() => ProfileSettingScreen()),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2FB3B3),
                      disabledBackgroundColor: Colors.grey.shade400,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
