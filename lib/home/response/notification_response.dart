class NotificationResponse {
  NotificationResponse({
    required this.status,
    required this.data,
    required this.message,
  });
  late final bool status;
  late final List<NotificationList> data;
  late final String message;

  NotificationResponse.fromJson(Map<String, dynamic> json){
    status = json['status'];
    data = List.from(json['data']).map((e)=>NotificationList.fromJson(e)).toList();
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

class NotificationList {
  NotificationList({
    required this.NotificationID,
    required this.Notification,
    required this.NotificationDT,
    required this.Status,
  });
  late final String NotificationID;
  late final String Notification;
  late final String NotificationDT;
  late final String Status;

  NotificationList.fromJson(Map<String, dynamic> json){
    NotificationID = json['NotificationID'];
    Notification = json['Notification'];
    NotificationDT = json['NotificationDT'];
    Status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final data1 = <String, dynamic>{};
    data1['NotificationID'] = NotificationID;
    data1['Notification'] = Notification;
    data1['NotificationDT'] = NotificationDT;
    data1['Status'] = Status;
    return data1;
  }
}