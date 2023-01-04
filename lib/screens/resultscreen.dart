import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../components/maputils.dart';

class ResultScreen extends StatefulWidget {
  final String animal;
  const ResultScreen({Key? key, required this.animal}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  int bpm = 0;
  int lat = 0;
  int long = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFEEF5DB),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 130.0,
            width: 100.0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage('images/dogpaw.png'),
                  height: 70.0,
                  width: 70.0,
                ),
                const Center(
                  child: Text(
                    "PetBit",
                    style: TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 30.0,
                      color: Color(0XFF4F6367),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Center(
                  child: Text(
                    " for ${widget.animal}",
                    style: const TextStyle(
                      fontFamily: 'Pacifico',
                      fontSize: 15.0,
                      color: Color(0XFF4F6367),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: SizedBox(
              height: 300,
              width: 150,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFB8D8D8),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    const Image(
                      image: AssetImage('images/heart_rate.png'),
                      height: 200.0,
                      width: 200.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Center(
                        child: Text(
                          'Heart Rate: '
                          '$bpm BPM',
                          style: const TextStyle(
                            fontFamily: 'Pacifico',
                            fontSize: 25.0,
                            color: Color(0XFF4F6367),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 250,
            width: 150,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF7A9B9F),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          GestureDetector(
                            onTap: () {
                              MapUtils.openMap(
                                lat.toDouble(),
                                long.toDouble(),
                              );
                            },
                            child: const Image(
                              image: AssetImage('images/maps.png'),
                              height: 90.0,
                              width: 90.0,
                            ),
                          ),
                          Center(
                            child: Text(
                              'Latitude: $lat',
                              style: const TextStyle(
                                fontFamily: 'Pacifico',
                                fontSize: 20.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              'Longitude: $long',
                              style: const TextStyle(
                                fontFamily: 'Pacifico',
                                fontSize: 20.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFFE5F55),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: const [
                          Image(
                            image: AssetImage(
                              'images/ring.png',
                            ),
                            height: 90.0,
                            width: 90.0,
                          ),
                          Center(
                            child: Text(
                              '1800-425-5880',
                              style: TextStyle(
                                fontFamily: 'Pacifico',
                                fontSize: 20.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    DatabaseReference ref = FirebaseDatabase.instance.ref('test');
    DatabaseReference pulse = ref.child('pulse');
    DatabaseReference latitude = ref.child('lat');
    DatabaseReference longitude = ref.child('long');
    Stream<DatabaseEvent> stream = pulse.onValue;
    Stream<DatabaseEvent> stream1 = latitude.onValue;
    Stream<DatabaseEvent> stream2 = longitude.onValue;
// Subscribe to the stream!
    stream.listen((DatabaseEvent event) {
      setState(() {
        bpm = (int.parse(event.snapshot.value.toString()).toInt() / 25).round();
      });
    });
    stream1.listen((DatabaseEvent event) {
      setState(() {
        lat = (int.parse(event.snapshot.value.toString()).toInt()).round();
      });
    });
    stream2.listen((DatabaseEvent event) {
      setState(() {
        long = (int.parse(event.snapshot.value.toString()).toInt()).round();
      });
    });
  }
}
