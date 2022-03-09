import 'package:flutter/foundation.dart';

class ChallengeController {
  final currentPageNotifier = ValueNotifier<int>(1);
  set currentPage(int currentPage) => currentPageNotifier.value = currentPage;
  int get currentPage => currentPageNotifier.value;
}
