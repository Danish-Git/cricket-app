class AdsModel {
/*
{
  "ID": "2",
  "BennerURL": "https://indiancitymarket.com/Cricket/AdvertisementBanner/H87GF5CP.jpg",
  "Title": "test7700",
  "Description": "Test Mod",
  "Status": "Publication",
  "Edate": "2024-04-05"
}
*/

  String? id;
  String? bannerURL;
  String? title;
  String? description;
  String? status;
  String? eDate;

  AdsModel({
    this.id,
    this.bannerURL,
    this.title,
    this.description,
    this.status,
    this.eDate,
  });

  AdsModel.fromJson(Map<String, dynamic> json) {
    id = json['ID']?.toString();
    bannerURL = json['BennerURL']?.toString();
    title = json['Title']?.toString();
    description = json['Description']?.toString();
    status = json['Status']?.toString();
    eDate = json['Edate']?.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['ID'] = id;
    data['BennerURL'] = bannerURL;
    data['Title'] = title;
    data['Description'] = description;
    data['Status'] = status;
    data['Edate'] = eDate;
    return data;
  }
}