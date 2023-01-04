import 'package:flutter/material.dart';
import 'package:test2/screens/resultscreen.dart';

class SpeciesCard extends StatelessWidget {
  final String imageString;
  final String speciesName;
  const SpeciesCard({
    Key? key,
    required this.imageString,
    required this.speciesName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100.0, vertical: 10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ResultScreen(animal: speciesName),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0XFFEEF5DB),
            borderRadius: BorderRadius.circular(30.0),
          ),
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Image(
                image: AssetImage(imageString),
              ),
              Text(
                speciesName,
                style: const TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 30.0,
                  color: Color(0XFF4F6367),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
