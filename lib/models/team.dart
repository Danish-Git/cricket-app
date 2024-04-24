class TeamModel {
/*
{
  "TournamentID": "3",
  "TeamID": "4",
  "TeamName": "test000",
  "TeamNickName": "t00",
  "TeamLogo": "https://indiancitymarket.com/Cricket/Teamlog/BP8RXD6I.jpg"
}
*/

  String? tournamentID;
  String? teamID;
  String? teamName;
  String? teamNickName;
  String? teamLogo;

  TeamModel({
    this.tournamentID,
    this.teamID,
    this.teamName,
    this.teamNickName,
    this.teamLogo,
  });

  TeamModel.fromJson(Map<String, dynamic> json) {
    tournamentID = json['TournamentID']?.toString();
    teamID = json['TeamID']?.toString();
    teamName = json['TeamName']?.toString();
    teamNickName = json['TeamNickName']?.toString();
    teamLogo = json['TeamLogo']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['TournamentID'] = tournamentID;
    data['TeamID'] = teamID;
    data['TeamName'] = teamName;
    data['TeamNickName'] = teamNickName;
    data['TeamLogo'] = teamLogo;
    return data;
  }
}