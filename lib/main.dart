import 'package:flutter/material.dart';
import 'package:todayis/whats_today.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
void main() {
  runApp(
    const ProviderScope(
          child:MyApp()
      ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      // theme: ThemeData(
      //     useMaterial3: true,
      //     brightness: Brightness.light,
      //   textTheme: GoogleFonts.mPlusRounded1cTextTheme(
      //     Theme.of(context).textTheme,
      //   )
      // ),

      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorSchemeSeed: Colors.blue,
        textTheme: GoogleFonts.mPlusRounded1cTextTheme(Theme.of(context).textTheme),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.blue,
        textTheme: GoogleFonts.mPlusRounded1cTextTheme(Theme.of(context).textTheme),
      ),
      themeMode: ThemeMode.system,
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(body:whats_today());
  }
}
