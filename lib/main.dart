import 'package:flutter/material.dart';

import './Screens/HomeScreen.dart';
import './Screens/InfoScreen.dart';

void main() => runApp(const Covid19App());

class Covid19App extends StatelessWidget {
  const Covid19App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: InfoScreen(),
    );
  }
}


