import 'package:flutter/material.dart';
import 'inicio.dart';
import 'capturaproductos.dart';
import 'verproductos.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Datos de Producto',
      theme: ThemeData(
        // Fondo color Guinda
        scaffoldBackgroundColor: const Color(0xFF800020),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF5A0016),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
          bodyLarge: TextStyle(color: Colors.white),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green, // Botones de color verde
            foregroundColor: Colors.white, // Letras claras (blancas)
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white12,
          labelStyle: const TextStyle(color: Colors.white70),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white30),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.green),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Inicio(),
        '/capturaproductos': (context) => const CapturaProductos(),
        '/verproductos': (context) => const VerProductos(),
      },
    );
  }
}
