import 'package:flutter/material.dart';
import 'package:unahplus/src/pages/login_page.dart';
import 'package:unahplus/src/pages/principal_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UnahPlus',
      theme: ThemeData().copyWith(
        scaffoldBackgroundColor: const Color.fromRGBO(12, 53, 106, 150),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/principal': (context) => const PrincipalPage(),
      },
    );
  }
}
