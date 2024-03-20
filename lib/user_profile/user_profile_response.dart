class UserProfileResponse {
  UserProfileResponse({
    required this.status,
    required this.data,
    required this.message,
  });
  late final bool status;
  late final List<UserProfileData> data;
  late final String message;

  UserProfileResponse.fromJson(Map<String, dynamic> json){
    status = json['status'];
    data = List.from(json['data']).map((e)=>UserProfileData.fromJson(e)).toList();
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

class UserProfileData {
  UserProfileData({
    required this.UserID,
    required this.Mobile,
    required this.UserName,
    required this.Email,
    required this.ProfilePicture,
    required this.FireBaseID,
  });
  late final String UserID;
  late final String Mobile;
  late final String UserName;
  late final String Email;
  late final String ProfilePicture;
  late final String FireBaseID;

  UserProfileData.fromJson(Map<String, dynamic> json){
    UserID = json['UserID'];
    Mobile = json['Mobile'];
    UserName = json['UserName'] ?? '';
    Email = json['Email'] ?? '';
    ProfilePicture = json['ProfilePicture'] ?? '';
    FireBaseID = json['FireBaseID'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['UserID'] = UserID;
    _data['Mobile'] = Mobile;
    _data['UserName'] = UserName;
    _data['Email'] = Email;
    _data['ProfilePicture'] = ProfilePicture;
    _data['FireBaseID'] = FireBaseID;
    return _data;
  }
}