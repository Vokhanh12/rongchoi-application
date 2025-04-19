import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';
import 'package:rongchoi_application/core/config/app.dart';
import 'package:rongchoi_application/core/routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Artboard? _artboard;

  void _nextScreen() {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushNamedAndRemoveUntil(
        AppRouter.login,
        (route) => false,
      );
    });
  }

  @override
  void initState() {
    super.initState();

    rootBundle.load('assets/animations/splash_logo.riv').then((data) {
      final file = RiveFile.import(data);
      final artboard = file.mainArtboard;

      artboard.addController(SimpleAnimation('Timeline 1'));

      setState(() => _artboard = artboard);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _nextScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _artboard == null
            ? const CircularProgressIndicator()
            : Rive(
                artboard: _artboard!,
                fit: BoxFit.contain,
              ),
      ),
    );
  }
}
