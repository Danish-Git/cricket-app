class GetAllTournamentResponse {
  GetAllTournamentResponse({
    required this.status,
    required this.data,
    required this.message,
  });
  late final bool status;
  late final List<AllTournamentList> data;
  late final String message;

  GetAllTournamentResponse.fromJson(Map<String, dynamic> json){
    status = json['status'];
    data = List.from(json['data']).map((e)=>AllTournamentList.fromJson(e)).toList();
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

class AllTournamentList {
  AllTournamentList({
    required this.TournamentID,
    required this.Tournament,
    required this.Banner,
    required this.AgeGroup,
    required this.Gender,
    required this.StartDate,
    required this.EndDate,
    required this.Type,
    required this.Status,
    required this.EntryDate,
  });
  late final String TournamentID;
  late final String Tournament;
  late final String Banner;
  late final String AgeGroup;
  late final String Gender;
  late final String StartDate;
  late final String EndDate;
  late final String Type;
  late final String Status;
  late final String EntryDate;

  AllTournamentList.fromJson(Map<String, dynamic> json){
    TournamentID = json['TournamentID'];
    Tournament = json['Tournament'];
    Banner = json['Banner'];
    AgeGroup = json['AgeGroup'];
    Gender = json['Gender'];
    StartDate = json['StartDate'];
    EndDate = json['EndDate'];
    Type = json['Type'] ?? '';
    Status = json['Status'];
    EntryDate = json['EntryDate'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['TournamentID'] = TournamentID;
    _data['Tournament'] = Tournament;
    _data['Banner'] = Banner;
    _data['AgeGroup'] = AgeGroup;
    _data['Gender'] = Gender;
    _data['StartDate'] = StartDate;
    _data['EndDate'] = EndDate;
    _data['Type'] = Type;
    _data['Status'] = Status;
    _data['EntryDate'] = EntryDate;
    return _data;
  }
}