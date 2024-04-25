class TeamModel {
/*
{
  "TournamentID": "3",
  "TeamID": "4",
  "TeamName": "test000",
  "TeamNickName": "t00",
  "TeamLogo": "https://indiancitymarket.com/Cricket/Teamlog/BP8RXD6I.jpg",
  "TeamDress": "https://indiancitymarket.com/Cricket/TeamDress/IFX5A1WU.jpg",
  "Enrtydate": "2024-03-04 18:18:34.000"
}
*/

  String? tournamentID;
  String? teamID;
  String? teamName;
  String? teamNickName;
  String? teamLogo;
  String? teamDress;
  String? entryDate;

  TeamModel({
    this.tournamentID,
    this.teamID,
    this.teamName,
    this.teamNickName,
    this.teamLogo,
    this.teamDress,
    this.entryDate,
  });

  TeamModel.fromJson(Map<String, dynamic> json) {
    tournamentID = json['TournamentID']?.toString();
    teamID = json['TeamID']?.toString();
    teamName = json['TeamName']?.toString();
    teamNickName = json['TeamNickName']?.toString();
    teamLogo = json['TeamLogo']?.toString();
    teamDress = json['TeamDress']?.toString();
    entryDate = json['Enrtydate']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['TournamentID'] = tournamentID;
    data['TeamID'] = teamID;
    data['TeamName'] = teamName;
    data['TeamNickName'] = teamNickName;
    data['TeamLogo'] = teamLogo;
    data['TeamDress'] = teamDress;
    data['Enrtydate'] = entryDate;
    return data;
  }
}