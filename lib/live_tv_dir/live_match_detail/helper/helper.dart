import '../../../models/main_scores.dart';
import '../../../models/match.dart';
import '../../../models/match_overs.dart';
import '../../../models/payer_scores.dart';

class LiveMatchHelper {
  static MatchOvers convertToOvers(num totalBalls) =>
      MatchOvers(over: totalBalls ~/ 6, remainingBalls: totalBalls % 6);

  static List<MainScoresModel> getMatchSores(List<PayerScores> playerList, MatchModel? match) {
    List<PayerScores> team1 = [];
    List<PayerScores> team2 = [];
    List<MainScoresModel> finalScoreList = [];

    playerList.forEach((element) {
      if(element.teamId == match?.team1ID) {
        team1.add(element);
      } else if(element.teamId == match?.team2ID) {
        team2.add(element);
      }
    });

    MainScoresModel team1Scores = getTeamScores(MainScoresModel(id: '1',
        tournamentID: match?.tournamentsID,
        teamID: match?.team1ID, runs: '0', overs: '0', pOut: '0'
    ), team1);
    MainScoresModel team2Scores = getTeamScores(MainScoresModel(id: '2',
        tournamentID: match?.tournamentsID,
        teamID: match?.team2ID, runs: '0', overs: '0', pOut: '0'
    ), team2);

    finalScoreList.add(team1Scores);
    finalScoreList.add(team2Scores);
    return finalScoreList;
  }

  static MainScoresModel getTeamScores(MainScoresModel mainScoresModel, List<PayerScores> team) {
    for (var element in team) {
      mainScoresModel.runs = ((num.tryParse(mainScoresModel.runs ?? '0') ?? 0) + (num.tryParse(element.r ?? '0') ?? 0)).toString();
      mainScoresModel.overs = ((num.tryParse(mainScoresModel.overs ?? '0') ?? 0) + (num.tryParse(element.b ?? '0') ?? 0)).toString();
    }
    final oversData = LiveMatchHelper.convertToOvers(num.tryParse(mainScoresModel.overs ?? '0') ?? 0);
    mainScoresModel.overs = '${oversData.over?.toString() ?? '0'}.${oversData.remainingBalls?.toString() ?? '0'}';
    return mainScoresModel;
  }

}