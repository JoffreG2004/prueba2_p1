import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view_model/empleado_viewmodel.dart';
import 'view/pantallas/inicio_pantalla.dart';
import 'view/pantallas/empleado_pantalla.dart';
import 'view/pantallas/resultado_pantalla.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => EmpleadoViewmodel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => InicioPantalla(),
        '/principal': (context) => EmpleadoPantalla(),
        '/resultado': (context) => ResultadoPantalla(),
      },
    );
  }
}
