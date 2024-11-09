import 'package:get/get.dart';

class NavigationController {
  final _routes = [
    '/favorites', // 0
    '/reels', // 1
    '/profile', // 2
    '/team', // 3
  ];

  int _currentIndex = 0;

  RxInt _currentTeam = 0.obs;

  int get currentIndex => _currentIndex;
  int get currentTeam => _currentTeam.value;

  void setCurrentTeam(int teamIndex) {
    _currentTeam.value = teamIndex;
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
