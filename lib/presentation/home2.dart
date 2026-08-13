import 'package:app/provider/provider_home2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  @override
  void initState() {
    super.initState();
    context.read<ProviderHome2>().listarUsuarios();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProviderHome2>();

    if (provider.isLoading) {
      return Scaffold(body: CircularProgressIndicator());
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('PROVIDER LISTBUILD', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(height: 10),
          itemCount: provider.usuarios.length,
          itemBuilder: (context, index) {
            final user = provider.usuarios[index];
            return _card(user);
          },
        ),
      ),
    );
  }
}

Widget _card(Map<String, dynamic> user) {
  return Container(
    width: double.infinity,
    height: 200,

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