import 'package:get/get.dart';

class TournamentRegisterController extends GetxController {
  String selectedTournament = 'Under 14';
  List<String> tournamentList = [
    'Under 14',
    'Under 16',
    'Under 19',
    'Ranji Trophy'
  ];

  void onTournamentChange(String tournament) {
    selectedTournament = tournament;
    update();
  }

  String selectedAge = 'Under 14';
  List<String> ageList = ['Under 14', 'Under 16', 'Under 19', 'Ranji Trophy'];

  void onAgeChange(String age) {
    selectedAge = age;
    update();
  }

  String selectedPlayerType = 'Bowler';
  List<String> playerTypeList = [
    'Bowler',
    'Batsmen',
    'Batsman & WicketKeeper',
    'All-Rounder'
  ];

  void onPlayerChange(String playerType) {
    selectedPlayerType = playerType;
    update();
  }
}
