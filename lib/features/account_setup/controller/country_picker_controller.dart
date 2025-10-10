// import 'package:get/get.dart';
// import 'package:country_picker/country_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:tt_clone/features/account_setup/screens/dummy_profile_screen.dart';

// class CountryPickerController extends GetxController {
//   final selectedCountry = ''.obs;
//   final selectedCountryCode = ''.obs;
//   final selectedFlag = ''.obs;

//   void showCountryPickerDialog(BuildContext context) {
//     final allCountries = CountryService().getAll();
//     String query = '';

//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       builder: (ctx) {
//         return SafeArea(
//           child: StatefulBuilder(
//             builder: (ctx, setState) {
//               List<Country> filtered = allCountries;

//               void filterCountries(String q) {
//                 setState(() {
//                   query = q;
//                   filtered = (q.trim().isEmpty)
//                       ? allCountries
//                       : allCountries.where((c) {
//                           final lower = q.toLowerCase();
//                           return c.name.toLowerCase().contains(lower) ||
//                               c.phoneCode.contains(lower) ||
//                               c.countryCode.toLowerCase().contains(lower);
//                         }).toList();
//                 });
//               }

//               return SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.85,
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(12.0),
//                       child: TextField(
//                         decoration: const InputDecoration(
//                           prefixIcon: Icon(Icons.search),
//                           hintText: 'Search country',
//                           border: OutlineInputBorder(),
//                           isDense: true,
//                           contentPadding: EdgeInsets.symmetric(
//                             vertical: 12,
//                             horizontal: 12,
//                           ),
//                         ),
//                         onChanged: filterCountries,
//                       ),
//                     ),
//                     Expanded(
//                       child: ListView.separated(
//                         itemCount: filtered.length,
//                         separatorBuilder: (_, __) =>
//                             const Divider(height: 1, thickness: 0.5),
//                         itemBuilder: (context, index) {
//                           final country = filtered[index];
//                           final isSelected =
//                               selectedCountryCode.value == country.countryCode;

//                           return GestureDetector(
//                             onTap: () {
//                               setState(() {
//                                 selectedCountryCode.value = country.countryCode;
//                                 selectedCountry.value =
//                                     '${country.flagEmoji} ${country.name} (+${country.phoneCode})';
//                                 selectedFlag.value = country.flagEmoji;
//                               });
//                             },
//                             child: Container(
//                               decoration: BoxDecoration(
//                                 color: isSelected
//                                     ? Colors.blue.withValues(alpha: 0.1)
//                                     : Colors.transparent,
//                                 border: Border(
//                                   left: BorderSide(
//                                     color: isSelected
//                                         ? Colors.blue
//                                         : Colors.transparent,
//                                     width: 3,
//                                   ),
//                                   bottom: BorderSide(
//                                     color: Colors.grey.shade300,
//                                   ),
//                                 ),
//                               ),
//                               child: ListTile(
//                                 leading: Text(
//                                   country.flagEmoji,
//                                   style: const TextStyle(fontSize: 22),
//                                 ),
//                                 title: Text(country.name),
//                                 subtitle: Text('+${country.phoneCode}'),
//                                 trailing: Radio<String>(
//                                   value: country.countryCode,
//                                   // ignore: deprecated_member_use
//                                   groupValue: selectedCountryCode.value,
//                                   // ignore: deprecated_member_use
//                                   onChanged: (value) {
//                                     setState(() {
//                                       selectedCountryCode.value = value!;
//                                       selectedCountry.value =
//                                           '${country.flagEmoji} ${country.name} (+${country.phoneCode})';
//                                       selectedFlag.value = country.flagEmoji;
//                                     });
//                                   },
//                                 ),
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(12.0),
//                       child: SizedBox(
//                         width: double.infinity,
//                         child: ElevatedButton(
//                           onPressed: selectedCountryCode.value.isEmpty
//                               ? null
//                               : () {
//                                   // close sheet first, then navigate
//                                   Get.back();
//                                   Future.delayed(
//                                     const Duration(milliseconds: 200),
//                                     () {
//                                       // Get.toNamed('/dummyProfileScreen');
//                                       Get.to(() => DummyProfileScreen());
//                                     },
//                                   );
//                                 },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Color(0xFF2FB3B3),
//                             disabledBackgroundColor: Colors.grey.shade400,
//                             padding: const EdgeInsets.symmetric(vertical: 14),
//                           ),
//                           child: const Text(
//                             'Continue',
//                             style: TextStyle(color: Colors.white, fontSize: 16),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:get/get.dart';
import 'package:country_picker/country_picker.dart';

class CountryPickerController extends GetxController {
  final selectedCountry = ''.obs;
  final selectedCountryCode = ''.obs;
  final selectedFlag = ''.obs;

  final allCountries = CountryService().getAll();
  final filteredCountries = <Country>[].obs;
  final searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    filteredCountries.assignAll(allCountries);
  }

  void filterCountries(String query) {
    searchQuery.value = query;
    if (query.trim().isEmpty) {
      filteredCountries.assignAll(allCountries);
    } else {
      final lower = query.toLowerCase();
      filteredCountries.assignAll(
        allCountries.where((c) {
          return c.name.toLowerCase().contains(lower) ||
              c.phoneCode.contains(lower) ||
              c.countryCode.toLowerCase().contains(lower);
        }).toList(),
      );
    }
  }

  void selectCountry(Country country) {
    selectedCountryCode.value = country.countryCode;
    selectedCountry.value =
        '${country.flagEmoji} ${country.name} (+${country.phoneCode})';
    selectedFlag.value = country.flagEmoji;
  }
}
