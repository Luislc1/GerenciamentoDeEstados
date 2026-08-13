# Gerenciamento de Estados — Flutter

Projeto de estudo criado para praticar as principais formas de gerenciamento de estado em Flutter, consumindo APIs externas e aplicando boas práticas de arquitetura.

## Objetivo

Entender na prática a diferença entre setState, FutureBuilder e Provider, e quando usar cada um.

## O que foi praticado

**Fase 1 — setState e requisição HTTP**

Tela simples que busca dados de um CEP ao abrir, usando a API pública do ViaCEP. Cobre o ciclo básico de initState, async/await, try/catch/finally e atualização de estado com setState.

**Fase 2 — Provider**

A mesma busca de CEP, mas com o estado movido para um ChangeNotifier. A tela passa a observar o Provider com context.watch e chama métodos com context.read, sem gerenciar estado diretamente.

**Fase 3 — ListView.builder e FutureBuilder**

Duas versões de uma tela que lista usuários consumindo a API JSONPlaceholder:

- Versão A: usa setState e ListView.separated para renderizar os itens
- Versão B: usa FutureBuilder sem initState e sem setState, deixando o Flutter gerenciar os estados do Future automaticamente

**Fase 4 — Quatro estados com Provider**

Tela completa com Provider que trata todos os estados possíveis de uma requisição: carregando, erro com botão de retry, lista vazia e lista com dados.

## APIs utilizadas

- ViaCEP: https://viacep.com.br
- JSONPlaceholder: https://jsonplaceholder.typicode.com

## Pacotes

- http
- provider

## Estrutura

```
lib/
├── main.dart
├── presentation/
│   ├── home.dart        # Fase 1 — setState + CEP
│   ├── home2.dart       # Fase 2 — Provider + CEP
│   ├── home3.dart       # Fase 3A — setState + ListView
│   ├── home4.dart       # Fase 3B — FutureBuilder
│   └── home5.dart       # Fase 4 — 4 estados com Provider
└── provider/
    ├── provider_home.dart
    ├── provider_home2.dart
    └── provider_home3.dart
```

## Como rodar

```bash
flutter pub get
flutter run
```

## Autor

Luis Carlos — github.com/Luislc1
