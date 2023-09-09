import 'package:casureco/handler/models/feeder.dart';
import 'package:flutter/material.dart';

extension FeederStatusExt on FeederStatus {
  Color get color {
    switch (this) {
      case FeederStatus.energized:
        return Colors.green;
      case FeederStatus.not_energized:
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
