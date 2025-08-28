import 'package:flutter/material.dart';
import 'package:sp_module_c_project/pages/detalhes.dart';
import 'package:sp_module_c_project/pages/home.dart';
import 'package:sp_module_c_project/pages/login.dart';
import 'package:sp_module_c_project/pages/perfil.dart';
import 'package:sp_module_c_project/pages/resumos.dart';
import 'package:sp_module_c_project/pages/splash.dart';
import 'package:sp_module_c_project/controllers/theme_controller.dart';

import 'styles/styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: ThemeController.isDarkMode,
      builder: (context, isDark, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: isDark
              ? ThemeData.dark().copyWith(
                  colorScheme: ColorScheme.fromSeed(
                    seedColor: Cores.azulClaro,
                    brightness: Brightness.dark,
                  ),
                  // fontFamily: 'Montserrat',
                )
              : ThemeData(
                  colorScheme: ColorScheme.fromSeed(seedColor: Cores.azulClaro),
                  fontFamily: 'Montserrat',
                ),
          routes: {
            '/detalhes': (context) => const Detalhes(),
            '/splash': (context) => const Splash(),
            '/login': (context) => const Login(),
            '/home': (context) => const Home(),
            '/resumos': (context) => const Resumos(),
            '/perfil': (context) => const Perfil(),
          },
          initialRoute: '/login',
        );
      },
    );
  }
}