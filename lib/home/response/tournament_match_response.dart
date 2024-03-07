class TournamentMatchesResponse {
  TournamentMatchesResponse({
    required this.status,
    required this.data,
    required this.message,
  });
  late final bool status;
  late final List<TournamentMatchList> data;
  late final String message;

  TournamentMatchesResponse.fromJson(Map<String, dynamic> json){
    status = json['status'];
    data = List.from(json['data']).map((e)=>TournamentMatchList.fromJson(e)).toList();
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

class TournamentMatchList {
  TournamentMatchList({
    required this.MatchID,
    required this.TournamentsID,
    required this.Team1ID,
    required this.Team2ID,
    required this.MatchDate,
    required this.MatchBanner,
    required this.MatchStatus,
    required this.EntryDate,
  });
  late final String MatchID;
  late final String TournamentsID;
  late final String Team1ID;
  late final String Team2ID;
  late final String MatchDate;
  late final String MatchBanner;
  late final String MatchStatus;
  late final String EntryDate;

  TournamentMatchList.fromJson(Map<String, dynamic> json){
    MatchID = json['MatchID'];
    TournamentsID = json['TournamentsID'];
    Team1ID = json['Team1_ID'];
    Team2ID = json['Team2_ID'];
    MatchDate = json['MatchDate'];
    MatchBanner = json['MatchBanner'];
    MatchStatus = json['MatchStatus'];
    EntryDate = json['EntryDate'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['MatchID'] = MatchID;
    _data['TournamentsID'] = TournamentsID;
    _data['Team1_ID'] = Team1ID;
    _data['Team2_ID'] = Team2ID;
    _data['MatchDate'] = MatchDate;
    _data['MatchBanner'] = MatchBanner;
    _data['MatchStatus'] = MatchStatus;
    _data['EntryDate'] = EntryDate;
    return _data;
  }
}