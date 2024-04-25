class TopPlayersModel {
/*
{
  "TournamentID": "3",
  "Sno": "1",
  "PlayerName": "Player Two",
  "TeamLogo": "https://indiancitymarket.com/Cricket/Teamlog/logo1.jpg",
  "Runs": "202",
  "Wicket": "5",
  "Match": "2",
  "Inning": "2"
}
*/

  String? tournamentID;
  String? sNo;
  String? playerName;
  String? teamLogo;
  String? runs;
  String? wicket;
  String? match;
  String? inning;

  TopPlayersModel({
    this.tournamentID,
    this.sNo,
    this.playerName,
    this.teamLogo,
    this.runs,
    this.wicket,
    this.match,
    this.inning,
  });

  TopPlayersModel.fromJson(Map<String, dynamic> json) {
    tournamentID = json['TournamentID']?.toString();
    sNo = json['Sno']?.toString();
    playerName = json['PlayerName']?.toString();
    teamLogo = json['TeamLogo']?.toString();
    runs = json['Runs']?.toString();
    wicket = json['Wicket']?.toString();
    match = json['Match']?.toString();
    inning = json['Inning']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['TournamentID'] = tournamentID;
    data['Sno'] = sNo;
    data['PlayerName'] = playerName;
    data['TeamLogo'] = teamLogo;
    data['Runs'] = runs;
    data['Wicket'] = wicket;
    data['Match'] = match;
    data['Inning'] = inning;
    return data;
  }
}