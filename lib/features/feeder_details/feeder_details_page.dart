import 'package:casureco/handler/models/feeder.dart';
import 'package:casureco/utilities/constant.dart';
import 'package:flutter/material.dart';

class FeederDetails extends StatelessWidget {
  const FeederDetails({
    required this.feeder,
    Key? key,
  }) : super(key: key);

  final Feeder? feeder;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(feeder?.name ?? emptyString),
      ),
    );
  }
}
