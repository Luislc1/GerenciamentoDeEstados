import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProviderHome2 extends ChangeNotifier {
  bool isLoading = true;

  List<dynamic> usuarios = [];

  Future<void> listarUsuarios() async {
    try {
      isLoading = true;
      final provider2 = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/users'),
      );

      usuarios = jsonDecode(provider2.body);
    } catch (e) {
      print(e);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
