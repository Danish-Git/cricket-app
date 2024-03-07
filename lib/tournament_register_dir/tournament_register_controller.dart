import 'package:get/get.dart';

class TournamentRegisterController extends GetxController {
  String selectedAge = '22';
  List<String> ageList = ['22', '23', '24', '25'];

  void onAgeChange(String age) {
    selectedAge = age;
    update();
  }

  String selectedPlayerType = 'Bowler';
  List<String> playerTypeList = [
    "Batsmen",
    "Bowler",
    "Batsman & WicketKeeper",
    "All-Rounder"
  ];

  void onPlayerChange(String playerType) {
    selectedPlayerType = playerType;
    update();
  }
}
