import 'dart:convert';

import 'package:casureco/handler/models/feeder.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ApiManager {
  final cf = FirebaseFirestore.instance.collection('feeders');

  Future<List<Feeder>> getAllFeeders() async {
    final feeders = <Feeder>[];

    await cf.get().then((query) {
      final docs = query.docs;

      for (final doc in docs) {
        feeders.add(Feeder.fromJson(doc.data()));
      }
    });

    return feeders;
  }

  Future<void> addFeeder() async {
    FirebaseFirestore.instance.collection('feeders').add({
      "id": 1,
      "status": 0,
      "name": "Feeder 12",
      "areas": ["Part of Barlin", "BIR", "Bonifacio St.", "Caceres St."],
      "updates": [
        {
          "id": 0,
          "status": 0,
          "startDate": DateTime.now().toString(),
          "endDate": DateTime.now().add(const Duration(hours: 5)).toString(),
          "description": "Corrective and Preventive Maintenance of Del Rosario and Concepcion Power Substation",
        }
      ]
    });
  }
}
