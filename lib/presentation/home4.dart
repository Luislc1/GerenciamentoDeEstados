import 'package:app/provider/provider_home3.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage4 extends StatefulWidget {
  const HomePage4({super.key});

  @override
  State<HomePage4> createState() => _HomePage4State();
}

class _HomePage4State extends State<HomePage4> {
  @override
  void initState() {
    super.initState();
    context.read<ProviderHome3>().buscarUsuarios();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProviderHome3>();

    // 1. carregando
    if (provider.isLoading) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    // 2. erro
    if (provider.erro != null) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Erro ao carregar'),
              ElevatedButton(
                onPressed: () => context.read<ProviderHome3>().buscarUsuarios(),
                child: Text('Tentar novamente'),
              ),
            ],
          ),
        ),
      );
    }

    // 3. lista vazia
    if (provider.usuarios.isEmpty) {
      return Scaffold(body: Center(child: Text('Nenhum usuário encontrado')));
    }

    // 4. com dados
    return Scaffold(
      body: ListView.separated(
        padding: EdgeInsets.all(20),
        itemCount: provider.usuarios.length,
        separatorBuilder: (context, index) => SizedBox(height: 10),
        itemBuilder: (context, index) {
          final user = provider.usuarios[index] as Map<String, dynamic>;
          return _card(user);
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
