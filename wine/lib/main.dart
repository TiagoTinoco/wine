import 'package:flutter/material.dart';
import 'package:wine/pages/home_page.dart';
import 'package:wine/pages/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 45, 40, 122),
              width: 1.5,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 45, 40, 122),
              width: 1.5,
            ),
          ),
        ),
        primarySwatch: Colors.blue,
      ),
      home: const SplashPage(),
      routes: {
        HomePage.routeName: (_) => const HomePage(),
      },
    );
  }
}
