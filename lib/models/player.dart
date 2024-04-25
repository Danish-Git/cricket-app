class PlayerModel {
/*
{
  "PlayerID": "40",
  "PlayerName": "rajesh",
  "FatherName": "fName",
  "MotherName": "mName",
  "DateOfBirth": "0000-00-00",
  "ProfilePicture": null,
  "UserType": "Bowler",
  "TotalScore": "11",
  "HighScore": "200",
  "Wickets": "10",
  "Six": "2",
  "Four": "3",
  "Matches": "11",
  "Varification": "1",
  "Status": "Active",
  "TournamentID": "10",
  "TeamID": "1",
  "TeamName": "Team_01",
  "TeamNickName": "Test_Team_01",
  "TeamLogo": "https://indiancitymarket.com/Cricket/Teamlog/logo1.jpg",
  "Play_as_a": "Batsman"
}
*/

  String? playerID;
  String? playerName;
  String? fatherName;
  String? motherName;
  String? dateOfBirth;
  String? profilePicture;
  String? userType;
  String? totalScore;
  String? highScore;
  String? wickets;
  String? six;
  String? four;
  String? matches;
  bool? isVerified;
  String? status;
  String? tournamentID;
  String? teamID;
  String? teamName;
  String? teamNickName;
  String? teamLogo;
  String? playingAs;

  PlayerModel({
    this.playerID,
    this.playerName,
    this.fatherName,
    this.motherName,
    this.dateOfBirth,
    this.profilePicture,
    this.totalScore,
    this.highScore,
    this.wickets,
    this.six,
    this.four,
    this.matches,
    this.isVerified,
    this.status,
    this.tournamentID,
    this.teamID,
    this.teamName,
    this.teamNickName,
    this.teamLogo,
    this.playingAs,
  });

  PlayerModel.fromJson(Map<String, dynamic> json) {
    playerID = json['PlayerID']?.toString();
    playerName = json['PlayerName']?.toString();
    fatherName = json['FatherName']?.toString();
    motherName = json['MotherName']?.toString();
    dateOfBirth = json['DateOfBirth']?.toString();
    profilePicture = json['ProfilePicture']?.toString();
    playingAs = json['UserType']?.toString();
    totalScore = json['TotalScore']?.toString();
    highScore = json['HighScore']?.toString();
    wickets = json['Wickets']?.toString();
    six = json['Six']?.toString();
    four = json['Four']?.toString();
    matches = json['Matches']?.toString();
    isVerified = json['Varification']?.toString() == '1';
    status = json['Status']?.toString();
    tournamentID = json['TournamentID']?.toString();
    teamID = json['TeamID']?.toString();
    teamName = json['TeamName']?.toString();
    teamNickName = json['TeamNickName']?.toString();
    teamLogo = json['TeamLogo']?.toString();
    playingAs = json['Play_as_a']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['PlayerID'] = playerID;
    data['PlayerName'] = playerName;
    data['FatherName'] = fatherName;
    data['MotherName'] = motherName;
    data['DateOfBirth'] = dateOfBirth;
    data['ProfilePicture'] = profilePicture;
    data['UserType'] = playingAs;
    data['TotalScore'] = totalScore;
    data['HighScore'] = highScore;
    data['Wickets'] = wickets;
    data['Six'] = six;
    data['Four'] = four;
    data['Matches'] = matches;
    data['Varification'] = isVerified ?? false ? '1' : '0';
    data['Status'] = status;
    data['TournamentID'] = tournamentID;
    data['TeamID'] = teamID;
    data['TeamName'] = teamName;
    data['TeamNickName'] = teamNickName;
    data['TeamLogo'] = teamLogo;
    data['Play_as_a'] = playingAs;
    return data;
  }
}