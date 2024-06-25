import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier {
  String _searchTerm = ''; // sSearch Term => مصطلح البحث

  String get searchTerm => _searchTerm;

  void updateSearchTerm(String term) {
    _searchTerm = term;
    notifyListeners();
  }
}
