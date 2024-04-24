class PointTableModel {
/*
{
  "Sno": "1",
  "TounamentsID": "3",
  "TeamLogo": "https://indiancitymarket.com/Cricket/Teamlog/logo1.jpg",
  "TeamName": "Team_03",
  "TeamNickName": "Test_Team_03",
  "MP": "50",
  "W": "23",
  "L": "28",
  "NR": "45",
  "NRR": "18.25",
  "PTS": "57"
}
*/

  String? sNo;
  String? tounamentsID;
  String? teamLogo;
  String? teamName;
  String? teamNickName;
  String? mp;
  String? w;
  String? l;
  String? nr;
  String? nrr;
  String? pts;

  PointTableModel({
    this.sNo,
    this.tounamentsID,
    this.teamLogo,
    this.teamName,
    this.teamNickName,
    this.mp,
    this.w,
    this.l,
    this.nr,
    this.nrr,
    this.pts,
  });

  PointTableModel.fromJson(Map<String, dynamic> json) {
    sNo = json['Sno']?.toString();
    tounamentsID = json['TounamentsID']?.toString();
    teamLogo = json['TeamLogo']?.toString();
    teamName = json['TeamName']?.toString();
    teamNickName = json['TeamNickName']?.toString();
    mp = json['MP']?.toString();
    w = json['W']?.toString();
    l = json['L']?.toString();
    nr = json['NR']?.toString();
    nrr = json['NRR']?.toString();
    pts = json['PTS']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['Sno'] = sNo;
    data['TounamentsID'] = tounamentsID;
    data['TeamLogo'] = teamLogo;
    data['TeamName'] = teamName;
    data['TeamNickName'] = teamNickName;
    data['MP'] = mp;
    data['W'] = w;
    data['L'] = l;
    data['NR'] = nr;
    data['NRR'] = nrr;
    data['PTS'] = pts;
    return data;
  }
}