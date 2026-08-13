import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProviderHome3 extends ChangeNotifier {
  bool isLoading = true;
  String? erro;

  List<dynamic> usuarios = [];

  Future<void> buscarUsuarios() async {
    isLoading = true;
    erro = null;

    notifyListeners();

    try {
      await Future.delayed(Duration(seconds: 2)); // 
      final result = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/users'),
      );
      usuarios = jsonDecode(result.body);
      //usuarios = []; // descomenta pra testar vazio
    } catch (e) {
      erro = e.toString(); // ← salva o erro pra UI mostrar
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
