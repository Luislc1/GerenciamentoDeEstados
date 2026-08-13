import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage3 extends StatelessWidget {
  const HomePage3({super.key});

  Future<List<dynamic>> buscarUsuarios() async {
    final result = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users'),
    );

    return jsonDecode(result.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FUTURE BUILDER', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: FutureBuilder<List<dynamic>>(future: buscarUsuarios(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }
          if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar'));
          }
          final usuarios = snapshot.data!;

          return ListView.separated(
            padding: EdgeInsets.all(10),
            separatorBuilder: (context, index) => SizedBox(height: 10),
            itemCount: usuarios.length,
            itemBuilder: (context, index) {
              final user = usuarios[index];
              return _card(user);
            },
            
          );
        },
      ),
    );
  }
}

Widget _card(user) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.lightBlueAccent,
      borderRadius: BorderRadius.circular(10),
    ),

    child: Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Id: ${user['id']}'),
          Text('Nome: ${user['name']}'),
          Text('Username: ${user['username']}'),
          Text('Email: ${user['email']}'),
          Text('Address: ${user['address']}'),
        ],
      ),
    ),
  );
}
