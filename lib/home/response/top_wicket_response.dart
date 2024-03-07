class TopWicketResponse {
  TopWicketResponse({
    required this.status,
    required this.data,
    required this.message,
  });
  late final bool status;
  late final List<TopWktList> data;
  late final String message;

  TopWicketResponse.fromJson(Map<String, dynamic> json){
    status = json['status'];
    data = List.from(json['data']).map((e)=>TopWktList.fromJson(e)).toList();
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

class TopWktList {
  TopWktList({
    required this.TournamentID,
    required this.PlayerName,
    required this.TeamLogo,
    required this.Wicket,
    required this.Match,
    required this.Innings,
  });
  late final String TournamentID;
  late final String PlayerName;
  late final String TeamLogo;
  late final String Wicket;
  late final String Match;
  late final String Innings;

  TopWktList.fromJson(Map<String, dynamic> json){
    TournamentID = json['TournamentID'];
    PlayerName = json['PlayerName'];
    TeamLogo = json['TeamLogo'];
    Wicket = json['Wicket'];
    Match = json['Match'];
    Innings = json['Innings'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['TournamentID'] = TournamentID;
    _data['PlayerName'] = PlayerName;
    _data['TeamLogo'] = TeamLogo;
    _data['Wicket'] = Wicket;
    _data['Match'] = Match;
    _data['Innings'] = Innings;
    return _data;
  }
}