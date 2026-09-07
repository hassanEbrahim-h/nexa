import 'package:flutter/material.dart';
import 'data/app_data.dart';
import 'screens/splash_screen.dart';

void main() => runApp(const NexaApp());

class NexaApp extends StatefulWidget {
  const NexaApp({super.key});
  @override
  State<NexaApp> createState() => _NexaAppState();
}

class _NexaAppState extends State<NexaApp> {
  bool dark = true;
  @override
  Widget build(BuildContext context) {
    final seed = Colors.deepPurple;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NEXA',
      themeMode: dark ? ThemeMode.dark : ThemeMode.light,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(seedColor: seed, brightness: Brightness.dark),
        scaffoldBackgroundColor: const Color(0xFF07111F),
        useMaterial3: true,
        cardTheme: CardThemeData(color: const Color(0xFF101D30), elevation: 0),
      ),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: seed),
        useMaterial3: true,
      ),
      home: SplashScreen(
        onThemeChanged: (v) => setState(() => dark = v),
      ),
    );
  }
}
