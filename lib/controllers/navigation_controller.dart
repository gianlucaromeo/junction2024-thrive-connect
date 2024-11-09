import 'package:get/get.dart';

class NavigationController {
  final _routes = [
    '/favorites', // 0
    '/reels', // 1
    '/profile', // 2
    '/team', // 3
    '/job', // 4
    '/start', // 5
    '/applicationSent', // 6
  ];

  int _currentIndex = 1;

  final RxInt _currentJobOfferIndex = 0.obs;

  int get currentIndex => _currentIndex;
  int get currentJobOfferIndex => _currentJobOfferIndex.value;

  void setCurrentTeam(int teamIndex) {
    _currentJobOfferIndex.value = teamIndex;
  }

  void setCurrentIndex(int index) {
    _currentIndex = index;
    Get.offAllNamed(_routes[index]);
  }

  void pushToIndex(int index) {
    _currentIndex = index;
    Get.toNamed(_routes[index]);
  }
}
