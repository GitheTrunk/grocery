import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController {
  var searchQuery = ''.obs;
  var selectedCategory = 'All'.obs;
  late ScrollController scrollController;

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  void updateSearch(String query) {
    searchQuery.value = query;
    debugPrint('Search query updated: $query');
  }
}
