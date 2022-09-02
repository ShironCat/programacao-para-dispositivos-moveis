import 'dart:io';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
            body: Stack(
          children: [
            const Positioned(top: 50, left: 50, child: Shuba()),
            Positioned(
                bottom: 10,
                right: 10,
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(color: Colors.red[300]),
                ))
          ],
        )),
      ),
    );
  }
}

class Shuba extends StatelessWidget {
  const Shuba({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
      width: 100,
      height: 100,
      image: FileImage(File.fromUri(Uri.parse(
          "/home/victor/Vídeos/Can't take my eyes off shuba-sUXrF10hRes-270.gif"))),
    );
  }
}
