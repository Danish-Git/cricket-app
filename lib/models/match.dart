class MatchModel {
/*
{
  "MatchID": "8",
  "TournamentsID": "3",
  "Tournament": "T20",
  "Banner": "https://indiancitymarket.com/Cricket/TournamentsBanner/JVCRQUW9.jpg",
  "Team1_ID": "4",
  "TeamName1": "test000",
  "TeamNickName1": "t00",
  "TeamLogo1": "https://indiancitymarket.com/Cricket/Teamlog/BP8RXD6I.jpg",
  "Team2_ID": "5",
  "TeamName2": "test002",
  "TeamNickName2": "t002",
  "TeamLogo2": "https://indiancitymarket.com/Cricket/Teamlog/K9XD3LR8.jpg",
  "MatchDate": "2024-04-04",
  "MatchBanner": "https://indiancitymarket.com/Cricket/MatchBanner/MZHDEF74.jpg",
  "MatchStatus": "Running",
  "EntryDate": "2024-04-04 10:21:46.000"
}
*/

  String? matchID;
  String? tournamentsID;
  String? tournament;
  String? banner;
  String? team1ID;
  String? teamName1;
  String? teamNickName1;
  String? teamLogo1;
  String? team2ID;
  String? teamName2;
  String? teamNickName2;
  String? teamLogo2;
  String? matchDate;
  String? matchBanner;
  String? matchStatus;
  String? entryDate;

  MatchModel({
    this.matchID,
    this.tournamentsID,
    this.tournament,
    this.banner,
    this.team1ID,
    this.teamName1,
    this.teamNickName1,
    this.teamLogo1,
    this.team2ID,
    this.teamName2,
    this.teamNickName2,
    this.teamLogo2,
    this.matchDate,
    this.matchBanner,
    this.matchStatus,
    this.entryDate,
  });

  MatchModel.fromJson(Map<String, dynamic> json) {
    matchID = json['MatchID']?.toString();
    tournamentsID = json['TournamentsID']?.toString();
    tournament = json['Tournament']?.toString();
    banner = json['Banner']?.toString();
    team1ID = json['Team1_ID']?.toString();
    teamName1 = json['TeamName1']?.toString();
    teamNickName1 = json['TeamNickName1']?.toString();
    teamLogo1 = json['TeamLogo1']?.toString();
    team2ID = json['Team2_ID']?.toString();
    teamName2 = json['TeamName2']?.toString();
    teamNickName2 = json['TeamNickName2']?.toString();
    teamLogo2 = json['TeamLogo2']?.toString();
    matchDate = json['MatchDate']?.toString();
    matchBanner = json['MatchBanner']?.toString();
    matchStatus = json['MatchStatus']?.toString();
    entryDate = json['EntryDate']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['MatchID'] = matchID;
    data['TournamentsID'] = tournamentsID;
    data['Tournament'] = tournament;
    data['Banner'] = banner;
    data['Team1_ID'] = team1ID;
    data['TeamName1'] = teamName1;
    data['TeamNickName1'] = teamNickName1;
    data['TeamLogo1'] = teamLogo1;
    data['Team2_ID'] = team2ID;
    data['TeamName2'] = teamName2;
    data['TeamNickName2'] = teamNickName2;
    data['TeamLogo2'] = teamLogo2;
    data['MatchDate'] = matchDate;
    data['MatchBanner'] = matchBanner;
    data['MatchStatus'] = matchStatus;
    data['EntryDate'] = entryDate;
    return data;
  }
}