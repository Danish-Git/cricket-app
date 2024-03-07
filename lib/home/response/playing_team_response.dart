class PlayingTeamResponse {
  PlayingTeamResponse({
    required this.status,
    required this.data,
    required this.message,
  });
  late final bool status;
  late final List<PlayingTeamList> data;
  late final String message;

  PlayingTeamResponse.fromJson(Map<String, dynamic> json){
    status = json['status'];
    data = List.from(json['data']).map((e)=>PlayingTeamList.fromJson(e)).toList();
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final data1 = <String, dynamic>{};
    data1['status'] = status;
    data1['data'] = data.map((e)=>e.toJson()).toList();
    data1['message'] = message;
    return data1;
  }
}

class PlayingTeamList {
  PlayingTeamList({
    required this.TournamentID,
    required this.TeamID,
    required this.TeamName,
    required this.TeamNickName,
    required this.TeamLogo,
  });
  late final String TournamentID;
  late final String TeamID;
  late final String TeamName;
  late final String TeamNickName;
  late final String TeamLogo;

  PlayingTeamList.fromJson(Map<String, dynamic> json){
    TournamentID = json['TournamentID'] ?? '';
    TeamID = json['TeamID'] ?? '';
    TeamName = json['TeamName'];
    TeamNickName = json['TeamNickName'];
    TeamLogo = json['TeamLogo'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['TournamentID'] = TournamentID;
    _data['TeamID'] = TeamID;
    _data['TeamName'] = TeamName;
    _data['TeamNickName'] = TeamNickName;
    _data['TeamLogo'] = TeamLogo;
    return _data;
  }
}