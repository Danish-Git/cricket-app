class TeamPlayerDetailResponse {
  TeamPlayerDetailResponse({
    required this.status,
    required this.data,
    required this.message,
  });
  late final bool status;


  late final List<TeamPlayerList> data;
  late final String message;

  TeamPlayerDetailResponse.fromJson(Map<String, dynamic> json){
    status = json['status'];


    data = List.from(json['data']).map((e)=>TeamPlayerList.fromJson(e)).toList();
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    _data['message'] = message;
    return _data;
  }
}



class TeamPlayerList {


  TeamPlayerList({
    required this.TournamentID,
    required this.TeamID,
    required this.TeamName,
    required this.TeamNickName,
    required this.TeamLogo,
    required this.PlayerID,
    required this.PlayerName,
    required this.ProfilePicture,
    required this.PlayAsA,
  });
  late final String TournamentID;
  late final String TeamID;
  late final String TeamName;
  late final String TeamNickName;
  late final String TeamLogo;
  late final String PlayerID;
  late final String PlayerName;
  late final String ProfilePicture;
  late final String PlayAsA;



  TeamPlayerList.fromJson(Map<String, dynamic> json){
    TournamentID = json['TournamentID'];
    TeamID = json['TeamID'];
    TeamName = json['TeamName'];
    TeamNickName = json['TeamNickName'];
    TeamLogo = json['TeamLogo'];
    PlayerID = json['PlayerID'];
    PlayerName = json['PlayerName'];
    ProfilePicture = json['ProfilePicture'];
    PlayAsA = json['Play_as_a'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['TournamentID'] = TournamentID;
    _data['TeamID'] = TeamID;
    _data['TeamName'] = TeamName;
    _data['TeamNickName'] = TeamNickName;
    _data['TeamLogo'] = TeamLogo;
    _data['PlayerID'] = PlayerID;
    _data['PlayerName'] = PlayerName;
    _data['ProfilePicture'] = ProfilePicture;
    _data['Play_as_a'] = PlayAsA;
    return _data;
  }
}