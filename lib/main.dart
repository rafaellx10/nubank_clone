// lib/main.dart
import 'package:flutter/material.dart';
import 'package:nubank_clone/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';

void main() {
  runApp(
    // O ChangeNotifierProvider é o que torna o ThemeProvider acessível
    // em qualquer lugar abaixo dele na árvore de widgets.
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: HomePage()),
    );
  }
}
