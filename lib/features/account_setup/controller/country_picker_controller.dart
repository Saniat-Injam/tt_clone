// import 'package:get/get.dart';
// import 'package:country_picker/country_picker.dart';
// import 'package:flutter/material.dart';

// class CountryPickerController extends GetxController {
//   final selectedCountry = ''.obs;
//   final selectedCountryCode = ''.obs;

//   void showCountryPickerDialog(BuildContext context) {
//     final allCountries = CountryService().getAll(); // from package
//     String query = '';

//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       builder: (ctx) {
//         return SafeArea(
//           child: StatefulBuilder(
//             builder: (ctx, setState) {
//               final filtered = (query.trim().isEmpty)
//                   ? allCountries
//                   : allCountries.where((c) {
//                       final q = query.toLowerCase();
//                       return c.name.toLowerCase().contains(q) ||
//                           c.phoneCode.contains(q) ||
//                           c.countryCode.toLowerCase().contains(q);
//                     }).toList();

//               return SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.75,
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(12.0),
//                       child: TextField(
//                         autofocus: false,
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
//                         onChanged: (v) => setState(() => query = v),
//                       ),
//                     ),
//                     Expanded(
//                       child: ListView.separated(
//                         itemCount: filtered.length,
//                         separatorBuilder: (_, __) => const Divider(height: 1),
//                         itemBuilder: (context, index) {
//                           final country = filtered[index];

//                           return Container(
//                             decoration: BoxDecoration(
//                               border: Border(
//                                 bottom: BorderSide(
//                                   color: Colors.grey.shade300,
//                                   width: 1,
//                                 ),
//                               ),
//                             ),
//                             child: ListTile(
//                               contentPadding: const EdgeInsets.symmetric(
//                                 horizontal: 16,
//                                 vertical: 6,
//                               ),
//                               leading: Text(
//                                 country.flagEmoji,
//                                 style: const TextStyle(fontSize: 22),
//                               ),
//                               title: Text(country.name),
//                               subtitle: Text('+${country.phoneCode}'),
//                               trailing: Radio<String>(
//                                 value: country.countryCode,
//                                 groupValue: selectedCountryCode.value,
//                                 onChanged: (value) {
//                                   // update selection, rebuild and close
//                                   selectedCountryCode.value = value!;
//                                   selectedCountry.value =
//                                       '${country.flagEmoji} ${country.name} (+${country.phoneCode})';
//                                   setState(() {}); // update radio visuals
//                                   Navigator.of(context).pop();
//                                 },
//                               ),
//                               onTap: () {
//                                 selectedCountryCode.value = country.countryCode;
//                                 selectedCountry.value =
//                                     '${country.flagEmoji} ${country.name} (+${country.phoneCode})';
//                                 setState(() {});
//                                 Navigator.of(context).pop();
//                               },
//                             ),
//                           );
//                         },
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
import 'package:flutter/material.dart';

class CountryPickerController extends GetxController {
  final selectedCountry = ''.obs;
  final selectedCountryCode = ''.obs;

  void showCountryPickerDialog(BuildContext context) {
    final allCountries = CountryService().getAll();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (ctx) {
        return SafeArea(
          child: StatefulBuilder(
            builder: (ctx, setState) {
              String query = '';

              final filtered = (query.trim().isEmpty)
                  ? allCountries
                  : allCountries.where((c) {
                      final q = query.toLowerCase();
                      return c.name.toLowerCase().contains(q) ||
                          c.phoneCode.contains(q) ||
                          c.countryCode.toLowerCase().contains(q);
                    }).toList();

              return Container(
                height: MediaQuery.of(context).size.height * 0.75,
                child: Column(
                  children: [
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
                        onChanged: (v) => setState(() => query = v),
                      ),
                    ),

                    // RadioGroup wraps the list so Radio widgets inside it
                    // are part of the same group (no groupValue/onChanged on each Radio).
                    Expanded(
                      child: RadioGroup<String>(
                        groupValue: selectedCountryCode.value.isEmpty
                            ? null
                            : selectedCountryCode.value,
                        onChanged: (value) {
                          // update selection and close
                          setState(() {
                            if (value != null) {
                              final country = allCountries.firstWhere(
                                (c) => c.countryCode == value,
                              );
                              selectedCountryCode.value = value;
                              selectedCountry.value =
                                  '${country.flagEmoji} ${country.name} (+${country.phoneCode})';
                            }
                          });
                          Navigator.of(context).pop();
                        },
                        child: ListView.separated(
                          itemCount: filtered.length,
                          separatorBuilder: (_, __) =>
                              const Divider(height: 1, thickness: 1),
                          itemBuilder: (context, index) {
                            final country = filtered[index];

                            return Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                    color: Colors.grey.shade300,
                                    width: 1,
                                  ),
                                ),
                              ),
                              child: ListTile(
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
                                ),
                                leading: Text(
                                  country.flagEmoji,
                                  style: const TextStyle(fontSize: 22),
                                ),
                                title: Text(country.name),
                                subtitle: Text('+${country.phoneCode}'),
                                // place a Radio on the trailing side; Radio has only `value` here
                                trailing: Radio<String>(
                                  value: country.countryCode,
                                ),
                                onTap: () {
                                  // tapping the row also selects and closes
                                  setState(() {
                                    selectedCountryCode.value =
                                        country.countryCode;
                                    selectedCountry.value =
                                        '${country.flagEmoji} ${country.name} (+${country.phoneCode})';
                                  });
                                  Navigator.of(context).pop();
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
