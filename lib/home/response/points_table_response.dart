class PointsTableResponse {
  PointsTableResponse({
    required this.status,
    required this.data,
    required this.message,
  });

  late final bool status;
  late final List<PointsTableData> data;
  late final String message;

  PointsTableResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = List.from(json['data']).map((e) => PointsTableData.fromJson(e)).toList();
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final data1 = <String, dynamic>{};
    data1['status'] = status;
    data1['data'] = data.map((e) => e.toJson()).toList();
    data1['message'] = message;
    return data1;
  }
}

class PointsTableData {
  PointsTableData({
    required this.Sno,
    required this.TounamentsID,
    required this.TeamID,
    required this.TeamLogo,
    required this.TeamName,
    required this.MP,
    required this.W,
    required this.L,
    required this.NR,
    required this.NRR,
    required this.PTS,
    required this.EntryDate,
  });

  late final String Sno;
  late final String TounamentsID;
  late final String TeamID;
  late final String TeamLogo;
  late final String TeamName;
  late final String MP;
  late final String W;
  late final String L;
  late final String NR;
  late final String NRR;
  late final String PTS;
  late final String EntryDate;

  PointsTableData.fromJson(Map<String, dynamic> json) {
    Sno = json['Sno'] ?? '';
    TounamentsID = json['TounamentsID'];
    TeamID = json['TeamID'] ?? '';
    TeamLogo = json['TeamLogo'] ?? '';
    TeamName = json['TeamName'] ?? '';
    MP = json['MP'];
    W = json['W'];
    L = json['L'];
    NR = json['NR'];
    NRR = json['NRR'];
    PTS = json['PTS'];
    EntryDate = json['EntryDate'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Sno'] = Sno;
    data['TounamentsID'] = TounamentsID;
    data['TeamID'] = TeamID;
    data['TeamLogo'] = TeamLogo;
    data['TeamName'] = TeamName;
    data['MP'] = MP;
    data['W'] = W;
    data['L'] = L;
    data['NR'] = NR;
    data['NRR'] = NRR;
    data['PTS'] = PTS;
    data['EntryDate'] = EntryDate;
    return data;
  }
}
