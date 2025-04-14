import 'dart:math';

import 'package:edtech_app/const/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

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

extension StringFieldHeaderExtension on String {
  /// Extension to directly transform a string to a styled TextField header widget
  ///
  /// Example usage:
  /// 'Email'.textFieldHeader(context)
  ///
  Widget textFieldHeader(BuildContext context) {
    return Text(
      this,
      style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColors.kPrimaryColor,
          ),
    ).objectCenterLeft();
  }
}
