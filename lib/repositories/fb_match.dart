import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import '../models/payer_scores.dart';

class FirebaseMatchRepository {
  StreamSubscription? batsmanStream;
  StreamSubscription? bowlersStream;
  DatabaseReference? refer;

  FirebaseMatchRepository() {
    refer = FirebaseDatabase.instance.ref('TeamRun(Danish)/');
  }

  void getBatsmanData({String? matchId, Function(List<PayerScores>)? onDataChange}) {
    checkIfDbInstanceAvailable();
    batsmanStream = refer?.onValue.listen((DatabaseEvent event) {
      final Object? data = event.snapshot.value;
      Map batsman = (data as Map)[matchId]['Batting'];
      List<PayerScores> list = [];
      for (var json in batsman.values) {
        list.add(PayerScores.fromJson(json.cast<String, dynamic>()));
      }
      onDataChange?.call(list);
    });
  }

  void getBowlersData({String? matchId, Function(List<PayerScores> playerList)? onDataChange}) {
    checkIfDbInstanceAvailable();
    bowlersStream = refer?.onValue.listen((DatabaseEvent event) {
      final Object? data = event.snapshot.value;
      Map batsman = (data as Map)[matchId]['Bowling'];
      List<PayerScores> list = [];
      for (var json in batsman.values) {
        list.add(PayerScores.fromJson(json.cast<String, dynamic>()));
      }
      onDataChange?.call(list);
    });
  }

  void checkIfDbInstanceAvailable() {
    refer ??= FirebaseDatabase.instance.ref('TeamRun(Danish)/');
  }

  onDispose() {
    batsmanStream?.cancel();
    bowlersStream?.cancel();
  }


}