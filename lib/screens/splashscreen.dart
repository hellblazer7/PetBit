import 'package:flutter/material.dart';
import 'package:test2/screens/animalscreen.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'splashscreen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFE5F55),
      body: GestureDetector(
        onTap: () {
          Navigator.popAndPushNamed(context, AnimalScreen.id);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(
              image: AssetImage('images/splashscreenpaw.png'),
              height: 200.0,
              width: 200.0,
            ),
            Center(
              child: Text(
                'PetBit',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 40.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
