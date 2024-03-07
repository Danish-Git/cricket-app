class TopRunResponse {
  TopRunResponse({
    required this.status,
    required this.data,
    required this.message,
  });
  late final bool status;
  late final List<TopRunList> data;
  late final String message;

  TopRunResponse.fromJson(Map<String, dynamic> json){
    status = json['status'];
    data = List.from(json['data']).map((e)=>TopRunList.fromJson(e)).toList();
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

class TopRunList {
  TopRunList({
    required this.TournamentID,
    required this.Sno,
    required this.PlayerName,
    required this.TeamLogo,
    required this.Runs,
    required this.Match,
    required this.Inning,
  });
  late final String TournamentID;
  late final String Sno;
  late final String PlayerName;
  late final String TeamLogo;
  late final String Runs;
  late final String Match;
  late final String Inning;

  TopRunList.fromJson(Map<String, dynamic> json){
    TournamentID = json['TournamentID'];
    Sno = json['Sno'];
    PlayerName = json['PlayerName'];
    TeamLogo = json['TeamLogo'];
    Runs = json['Runs'];
    Match = json['Match'];
    Inning = json['Inning'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['TournamentID'] = TournamentID;
    _data['Sno'] = Sno;
    _data['PlayerName'] = PlayerName;
    _data['TeamLogo'] = TeamLogo;
    _data['Runs'] = Runs;
    _data['Match'] = Match;
    _data['Inning'] = Inning;
    return _data;
  }
}