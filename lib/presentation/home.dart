import 'package:app/provider/provider_home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    context.read<ProviderHome>().buscarCep();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProviderHome>();

    if (provider.isLoading){
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('PROVIDER'), centerTitle: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'CEP RECEBIDO: ${provider.cep}',
            )
          )
        ]
      ),
    );
  }
}
