import 'package:flutter/material.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;
  const SplashScreen({super.key, required this.onThemeChanged});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      if(mounted) Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (_) => OnboardingScreen(onThemeChanged: widget.onThemeChanged)));
    });
  }
  @override
  Widget build(BuildContext context) => Scaffold(
    body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(width: 110,height: 110, decoration: BoxDecoration(
        gradient: const LinearGradient(colors:[Color(0xFF7B61FF), Color(0xFF4CC9F0)]),
        borderRadius: BorderRadius.circular(30)),
        child: const Icon(Icons.north_east_rounded, size: 65, color: Colors.white)),
      const SizedBox(height: 24),
      const Text('NEXA', style: TextStyle(fontSize: 42, letterSpacing: 8, fontWeight: FontWeight.bold)),
      const SizedBox(height: 8),
      const Text('Your Life. Organized.', style: TextStyle(color: Colors.grey)),
    ])),
  );
}
