/*
*  main.dart
*  Draft_1
*
*  Created by Artem.
*  Copyright © 2018 Supernova. All rights reserved.
    */

import 'package:exebit21_covid/statistics_widget/statistics_widget.dart';
import 'package:flutter/material.dart';
import 'package:exebit21_covid/benched_widget/benched_widget.dart';
import 'package:exebit21_covid/news1.dart';
void main() => runApp(App());


class App extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
  
    return MaterialApp(
      home: BenchedWidget(),
    );
  }
}
