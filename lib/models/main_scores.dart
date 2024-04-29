class MainScoresModel {
/*
{
  "ID": "5",
  "TournamentID": "3",
  "TeamID": "4",
  "Runs": "300",
  "Overs": "22.3",
  "POut": "7"
}
*/

  String? id;
  String? tournamentID;
  String? teamID;
  String? runs;
  String? overs;
  String? pOut;

  MainScoresModel({
    this.id,
    this.tournamentID,
    this.teamID,
    this.runs,
    this.overs,
    this.pOut,
  });

  MainScoresModel.fromJson(Map<String, dynamic> json) {
    id = json['ID']?.toString();
    tournamentID = json['TournamentID']?.toString();
    teamID = json['TeamID']?.toString();
    runs = json['Runs']?.toString();
    overs = json['Overs']?.toString();
    pOut = json['POut']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['ID'] = id;
    data['TournamentID'] = tournamentID;
    data['TeamID'] = teamID;
    data['Runs'] = runs;
    data['Overs'] = overs;
    data['POut'] = pOut;
    return data;
  }
}