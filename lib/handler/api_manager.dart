import 'package:casureco/handler/models/feeder.dart';
import 'package:casureco/handler/models/user_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ApiManager {
  final cF = FirebaseFirestore.instance.collection('feeders');
  final cU = FirebaseFirestore.instance.collection('users');



  Future<List<Feeder>> getAllFeeders() async {
    final feeders = <Feeder>[];

    await cF.get().then((query) {
      final docs = query.docs;

      for (final doc in docs) {
        feeders.add(Feeder.fromJson(doc.data()));
      }
    });

    return feeders;
  }

  Stream<List<Feeder>> getAllFeedersStream() {
    return cF.snapshots().map((querySnapshot) {
      final feeders = <Feeder>[];
      for (final doc in querySnapshot.docs) {
        feeders.add(Feeder.fromJson(doc.data()));
      }
      return feeders;
    });
  }

  Future<void> subscribeFeeder(AppUserInfo userInfo) async => cU.doc(userInfo.userId).update(userInfo.toJson());

  Future<void> addFeeder() async {}

  Future<void> addUser(AppUserInfo appUserInfo) async => cU.doc(appUserInfo.userId).set(appUserInfo.toJson());

  Future<AppUserInfo?> getUserCompleteInfo(AppUserInfo appUserInfo) async {
    final snapshot = await cU.doc(appUserInfo.userId).get();
    try {
      return snapshot.exists ? AppUserInfo.fromJson(snapshot.data()!) : null;
    } catch (e) {
      debugPrint(e.toString());
    }
    return null;
  }
}
