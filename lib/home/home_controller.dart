import 'package:cricket/app_utils/app_static.dart';
import 'package:cricket/home/response/quiz_question_response.dart';
import 'package:get/get.dart';
import '../ui_models/tab_bar_model.dart';
import 'home_repo.dart';

class HomeController extends GetxController {
  final HomeRepo _homeRepo = HomeRepo();

  bool isLoading = true;

  int selectedTournamentStatus = 0;
  int selectedFilterStatus = 0;

  List<TabBarModel> tournamentStatusList = [
    TabBarModel(id: 'Running', label: 'Running', isSelected: false),
    TabBarModel(id: 'Coming soon', label: 'Upcoming', isSelected: false),
    TabBarModel(id: 'Complete', label: 'Complete', isSelected: false),
    TabBarModel(id: 'Cancel', label: 'Canceled', isSelected: false),
  ];

  List<TabBarModel> filterStatusList = [
    TabBarModel(id: 'Man', label: "Man's", isSelected: false),
    TabBarModel(id: 'Woman', label: "Women's", isSelected: false),
  ];

  /// #important
  /// String phoneNumber; // read from shared preferences

  @override
  void onInit() {
    super.onInit();
    initData();
  }

  void initData() {
    tournamentStatusList[selectedTournamentStatus].isSelected = true;
    filterStatusList[selectedFilterStatus].isSelected = true;
    quizQuestion();
  }

  //////

  List<QuizQuestionList> questionList = [];

  String selectedAns = '';
  String correctAns = '';
  String wrongAns = '';

  void onSelectQuizAns(String ans) {
    if (selectedAns.isEmpty) {
      correctAns = questionList[0].CorrectOption;
      selectedAns = ans;
      update();
    }
  }

  void quizQuestion() {
    _homeRepo.getQuizQuestionHome().then((value) {
      if (value.status) {
        QuizQuestionResponse response =
            QuizQuestionResponse.fromJson(value.data);
        questionList.addAll(response.data);
        update();
      }
    });
  }

  void saveQuizAnswer(String id, String answer) {
    _homeRepo
        .saveQuizQuestionAnswerHome(
            mobile: AppStatic.userNumber, quizId: id, answer: answer)
        .then((value) {
      if (value.status) {
        print(value.message.toString());
      }
    });
  }

  void onTournamentStatusChange(TabBarModel tabBarModel) {
    int selectedIndex = 0;
    for (int i = 0; i < tournamentStatusList.length; i++) {
      final status = tournamentStatusList[i];
      status.isSelected = (status == tabBarModel);
      if (status.isSelected ?? false) {
        selectedIndex = i;
      }
    }
    selectedTournamentStatus = selectedIndex;
    update();
  }

  void onGenderToggle(int? index) {
    for (int i = 0; i < filterStatusList.length; i++) {
      filterStatusList[i].isSelected = (i == index);
    }
    selectedFilterStatus =  index ?? 0;
    update();
  }

  void onFilerStatusChange(String filterId) {
    for (final status in tournamentStatusList) {
      status.isSelected = (status.id == filterId);
    }
    update();
  }

  //////////

  int correctAnswerIndex(QuizQuestionList question) {
    if (question.CorrectOption == question.Option1) {
      return 1;
    } else if (question.CorrectOption == question.Option2) {
      return 2;
    } else if (question.CorrectOption == question.Option3) {
      return 3;
    } else if (question.CorrectOption == question.Option4) {
      return 4;
    } else {
      return 0;
    }
  }
}
