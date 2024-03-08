class QuizQuestionResponse {
  QuizQuestionResponse({
    required this.status,
    required this.data,
    required this.message,
  });
  late final bool status;
  late final List<QuizQuestionList> data;
  late final String message;

  QuizQuestionResponse.fromJson(Map<String, dynamic> json){
    status = json['status'];
    data = List.from(json['data']).map((e)=>QuizQuestionList.fromJson(e)).toList();
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

class QuizQuestionList {
  QuizQuestionList({
    required this.ID,
    required this.Question,
    required this.Option1,
    required this.Option2,
    required this.Option3,
    required this.Option4,
    required this.CorrectOption,
  });
  late final String ID;
  late final String Question;
  late final String Option1;
  late final String Option2;
  late final String Option3;
  late final String Option4;
  late final String CorrectOption;

  QuizQuestionList.fromJson(Map<String, dynamic> json){
    ID = json['ID'];
    Question = json['Question'];
    Option1 = json['Option1'];
    Option2 = json['Option2'];
    Option3 = json['Option3'];
    Option4 = json['Option4'];
    CorrectOption = json['CorrectOption'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ID'] = ID;
    _data['Question'] = Question;
    _data['Option1'] = Option1;
    _data['Option2'] = Option2;
    _data['Option3'] = Option3;
    _data['Option4'] = Option4;
    _data['CorrectOption'] = CorrectOption;
    return _data;
  }
}