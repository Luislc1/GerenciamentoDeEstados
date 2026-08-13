import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProviderHome extends ChangeNotifier{

  bool isLoading = true;

  Map<String,dynamic>? cep;

  Future<void> buscarCep() async {
    try{
      isLoading = true;
      final result = await http.get(Uri.parse('https://viacep.com.br/ws/75906260/json/'));
      cep = jsonDecode(result.body);
    }catch(e){
      print(e);
    }finally{
      isLoading = false;
      notifyListeners();
    }
  }
}