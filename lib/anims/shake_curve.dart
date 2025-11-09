import 'dart:math';

import 'package:flutter/material.dart';

class ShakeCurve extends Curve {
  @override
  double transformInternal(double t) {
    // Example: A simple sine wave for shaking
    return sin(t * pi * 4) * (1 - t);
  }
}
