import 'package:flutter/material.dart';

import '../components/speciescard.dart';

class AnimalScreen extends StatefulWidget {
  static const String id = 'animal_screen';
  const AnimalScreen({Key? key}) : super(key: key);

  @override
  State<AnimalScreen> createState() => _AnimalScreenState();
}

class _AnimalScreenState extends State<AnimalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFE5F55),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: const [
          SizedBox(
            height: 50.0,
          ),
          Center(
            child: Text(
              'Device is being used for:',
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 30.0,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          SpeciesCard(imageString: 'images/dog.png', speciesName: 'Dog'),
          SizedBox(
            height: 20.0,
          ),
          SpeciesCard(imageString: 'images/cat.png', speciesName: 'Cat'),
          SizedBox(
            height: 20.0,
          ),
          SpeciesCard(imageString: 'images/human.png', speciesName: 'Human'),
        ],
      ),
    );
  }
}
