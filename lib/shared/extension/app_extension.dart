import 'dart:math';

import 'package:flutter/material.dart';

extension HardCodedString on String {
  //INFO
  // add this to harcoded strings to find them later
  String get hardCoded {
    return this;
  }
}

extension HardCodedBool on bool {
  //INFO
  // add this to harcoded bools to find them later
  bool get hardCodedBool {
    return this;
  }
}

extension HardCodedInteger on int {
  //Extension for hardcoded integers
  int get hardCodedInteger {
    return this;
  }
}

extension HardCodedDouble on double {
  //Extension for hardcoded integers
  double get hardCodedDouble {
    return this;
  }
}

extension ColorExtension on Widget {
  static final List<Color> _colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
    Colors.pink,
    Colors.teal,
    Colors.indigo,
    Colors.cyan,
  ];

  Widget withRandomColor({bool randomizeChild = false}) {
    final random = Random();
    final color = _colors[random.nextInt(_colors.length)];

    if (randomizeChild && this is Container) {
      return Container(
        color: color,
        child: (this as Container).child?.withRandomColor(randomizeChild: true),
      );
    } else {
      return ColoredBox(
        color: color,
        child: this,
      );
    }
  }

  List<Widget> generateRandomColorWidgets(int count) {
    return List.generate(
      count,
      (index) => withRandomColor(),
    );
  }
}
