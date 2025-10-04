import 'package:get/get.dart';

import 'package:tt_clone/core/utils/constants/image_path.dart';

class FollowSomeoneController extends GetxController {
  final List<Map<String, dynamic>> originalList = [
    {
      'image': Assetpath.followsomeone1,
      'title': 'Jane Cooper',
      'subtitle': 'Medical Assistant',
      'follow': true,
    },
    {
      'image': Assetpath.followsomeone2,
      'title': 'Wade Warrem',
      'subtitle': 'President of Sales',
      'follow': false,
    },
    {
      'image': Assetpath.followsomeone3,
      'title': 'Jenny Wilson',
      'subtitle': 'Web Designer',
      'follow': true,
    },
    {
      'image': Assetpath.followsomeone4,
      'title': 'Kristin Watson',
      'subtitle': 'Dog Trainer',
      'follow': false,
    },
    {
      'image': Assetpath.followsomeone5,
      'title': 'Annette Black',
      'subtitle': 'Nursing Assistant',
      'follow': false,
    },
    {
      'image': Assetpath.followsomeone6,
      'title': 'Theresa Webb',
      'subtitle': 'Marketing Coordinator',
      'follow': true,
    },
  ];

  RxList<Map<String, dynamic>> filteredList = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    filteredList.value = originalList;
  }

  void updateSearch(String query) {
    if (query.isEmpty) {
      filteredList.value = originalList;
    } else {
      filteredList.value = originalList
          .where(
            (item) => item['title'].toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    }
  }
}
