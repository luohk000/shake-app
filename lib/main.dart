import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

Random r = new Random();
List<Widget> images = [
  const Image(image: AssetImage("assets/00.jpg"), fit: BoxFit.fill),
  const Image(image: AssetImage("assets/01.jpg"), fit: BoxFit.fill),
  const Image(image: AssetImage("assets/02.jpg"), fit: BoxFit.fill),
  const Image(image: AssetImage("assets/03.jpg"), fit: BoxFit.fill),
  const Image(image: AssetImage("assets/04.jpg"), fit: BoxFit.fill),
  const Image(image: AssetImage("assets/05.jpg"), fit: BoxFit.fill),
  const Image(image: AssetImage("assets/06.jpg"), fit: BoxFit.fill),
  const Image(image: AssetImage("assets/07.jpg"), fit: BoxFit.fill),
  const Image(image: AssetImage("assets/08.jpg"), fit: BoxFit.fill),
  const Image(image: AssetImage("assets/09.jpg"), fit: BoxFit.fill),
];
int ind = r.nextInt(images.length);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'shake',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(title: 'shake app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    ShakeDetector s = ShakeDetector.autoStart(
      onPhoneShake: () {
        changePic();
      },
      shakeCountResetTime: 3000,
      shakeSlopTimeMS: 500,
      shakeThresholdGravity: 1.1,
      minimumShakeCount: 1,
    );
  }

  void changePic() {
    setState(() {
      int x = ind;
      ind = r.nextInt(images.length);
      while (x == ind) ind = r.nextInt(images.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: images.elementAt(ind),
      ),
    );
  }
}
