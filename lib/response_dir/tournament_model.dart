class TournamentModel {
/*
{
  "TournamentID": "3",
  "Tournament": "T20",
  "Banner": "https://indiancitymarket.com/Cricket/TournamentsBanner/JVCRQUW9.jpg",
  "AgeGroup": "20",
  "Gender": "Man",
  "StartDate": "2024-02-20",
  "EndDate": "2024-02-27",
  "Type": "1 Day",
  "Status": "Running",
  "EntryDate": "2024-02-17 00:00:00.000"
}
*/

  String? TournamentID;
  String? Tournament;
  String? Banner;
  String? AgeGroup;
  String? Gender;
  String? StartDate;
  String? EndDate;
  String? Type;
  String? Status;
  String? EntryDate;

  TournamentModel({
    this.TournamentID,
    this.Tournament,
    this.Banner,
    this.AgeGroup,
    this.Gender,
    this.StartDate,
    this.EndDate,
    this.Type,
    this.Status,
    this.EntryDate,
  });

  TournamentModel.fromJson(Map<String, dynamic> json) {
    TournamentID = json['TournamentID']?.toString();
    Tournament = json['Tournament']?.toString();
    Banner = json['Banner']?.toString();
    AgeGroup = json['AgeGroup']?.toString();
    Gender = json['Gender']?.toString();
    StartDate = json['StartDate']?.toString();
    EndDate = json['EndDate']?.toString();
    Type = json['Type']?.toString();
    Status = json['Status']?.toString();
    EntryDate = json['EntryDate']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['TournamentID'] = TournamentID;
    data['Tournament'] = Tournament;
    data['Banner'] = Banner;
    data['AgeGroup'] = AgeGroup;
    data['Gender'] = Gender;
    data['StartDate'] = StartDate;
    data['EndDate'] = EndDate;
    data['Type'] = Type;
    data['Status'] = Status;
    data['EntryDate'] = EntryDate;
    return data;
  }
}