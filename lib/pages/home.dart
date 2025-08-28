import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sp_module_c_project/controllers/app.dart';
import 'package:sp_module_c_project/pages/artigos.dart';
import 'package:sp_module_c_project/pages/perfil.dart';
import 'package:sp_module_c_project/pages/resumos.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  startApp() async {
    await Permission.microphone.request();

    String jsonArtigos = await rootBundle.loadString('assets/artigos.json');
    String jsonArtigo = await rootBundle.loadString('assets/artigo.json');

    App.artigos = jsonDecode(jsonArtigos);
    App.artigo = jsonDecode(jsonArtigo);

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    startApp();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: App.pagina,
      builder: (context, pagina, child) => Scaffold(
        body: App.artigos.isEmpty
            ? Center(child: CircularProgressIndicator())
            : IndexedStack(
                index: App.pagina.value,
                children: [Artigos(), Resumos(), Perfil()],
              ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.mic), label: 'Resumos'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
          ],
          currentIndex: App.pagina.value,
          onTap: (value) => App.pagina.value = value,
        ),
      ),
    );
  }
}