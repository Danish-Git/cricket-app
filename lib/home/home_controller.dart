import 'package:carousel_slider/carousel_controller.dart';
import 'package:cricket/app_utils/app_static.dart';
import 'package:cricket/home/response/quiz_question_response.dart';
import 'package:cricket/routing_dir/app_screen_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_repo.dart';
import '../response_dir/get_all_tournament_response.dart';
import 'response/notification_response.dart';

class HomeController extends GetxController {
  final HomeRepo _homeRepo = HomeRepo();
  bool isLoading = true;

  /// #important
  /// String phoneNumber; // read from shared preferences

  @override
  void onInit() {
    super.onInit();
    getAllNotifications();
  }

/////   NOTIFICATION

  List<NotificationList> notificationList = [];

  void getAllNotifications() {
    _homeRepo.getAllNotificationsApi().then((value) {
      if (value.status == true) {
        NotificationResponse notificationResponse =
            NotificationResponse.fromJson(value.data);
        notificationList.addAll(notificationResponse.data);
      }
    });
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

  ////////// select your team

  ScrollController teamListController = ScrollController();

  List<String> teamList = [
    'http://via.placeholder.com/350x150',
    'http://via.placeholder.com/350x150',
    'http://via.placeholder.com/350x150',
    'http://via.placeholder.com/350x150',
    'http://via.placeholder.com/350x150',
    'http://via.placeholder.com/350x150',
    'http://via.placeholder.com/350x150',
    'http://via.placeholder.com/350x150'
  ];

  ////////

  int upComingIndex = 0;
  int runningIndex = 0;
  int completedIndex = 0;
  int iplIndex = 0;
  int cancelIndex = 0;

  final CarouselController upComingCarouselController = CarouselController();
  final CarouselController runningCarouselController = CarouselController();
  final CarouselController completedCarouselController = CarouselController();
  final CarouselController iplCarouselController = CarouselController();
  final CarouselController cancelCarouselController = CarouselController();

  void onUpComingChange(int index) {
    upComingIndex = index;
    update();
  }

  void onRunningChange(int index) {
    runningIndex = index;
    update();
  }

  void onCompletedChange(int index) {
    completedIndex = index;
    update();
  }

  void onIplChange(int index) {
    iplIndex = index;
    update();
  }

  void onCancelChange(int index) {
    cancelIndex = index;
    update();
  }

  @override
  void onReady() {
    super.onReady();
    quizQuestion();
    getAllTournament();
  }

  List<Widget> upComingTournament = [];
  List<Widget> runningTournament = [];
  List<Widget> completeTournament = [];
  List<Widget> cancelTournament = [];
  List<Widget> iplTournament = [];

  /////

  List<AllTournamentList> upComingList = [];
  List<AllTournamentList> runningList = [];
  List<AllTournamentList> completeList = [];
  List<AllTournamentList> cancelList = [];
  List<AllTournamentList> iplList = [];

  void getAllTournament() {
    _homeRepo.getALlTournamentsHome().then((value) {
      if (value.status == true) {
        GetAllTournamentResponse response =
            GetAllTournamentResponse.fromJson(value.data);

        for (var item in response.data) {
          if (item.Status == 'UpComing') {
            upComingList.add(item);
          } else if (item.Status == 'Running') {
            runningList.add(item);
          } else if (item.Status == 'Complete') {
            completeList.add(item);
          } else if (item.Status == 'Cancel') {
            cancelList.add(item);
          }
        }

        addUpComingTournaments();
        addRunningTournaments();
        addCompletedTournaments();
        addIplTournaments();
        addCancelTournaments();
      }
    });
  }

  void addUpComingTournaments() {
    upComingTournament = upComingList
        .map(
          (item) => Container(
            margin: const EdgeInsets.all(2.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              child: Image.network(
                item.Banner,
                fit: BoxFit.cover,
                width: 1000,
              ),
            ),
          ),
        )
        .toList();
  }

  void addRunningTournaments() {
    runningTournament = runningList
        .map(
          (item) => Container(
            margin: const EdgeInsets.all(2.0),
            child: GestureDetector(
              onTap: () {
                Get.toNamed(AppScreenConst.matchDetail);
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                child: Image.network(
                  item.Banner,
                  fit: BoxFit.cover,
                  width: 1000,
                ),
              ),
            ),
          ),
        )
        .toList();
  }

  void addCompletedTournaments() {
    completeTournament = completeList
        .map(
          (item) => Container(
            margin: const EdgeInsets.all(2.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              child: Image.network(
                item.Banner,
                fit: BoxFit.cover,
                width: 1000,
              ),
            ),
          ),
        )
        .toList();
  }

  void addIplTournaments() {
    iplTournament = completeList
        .map(
          (item) => Container(
            margin: const EdgeInsets.all(2.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              child: Image.network(
                item.Banner,
                fit: BoxFit.cover,
                width: 1000,
              ),
            ),
          ),
        )
        .toList();
  }

  void addCancelTournaments() {
    cancelTournament = cancelList
        .map(
          (item) => Container(
            margin: const EdgeInsets.all(2.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              child: Image.network(
                item.Banner,
                fit: BoxFit.cover,
                width: 1000,
              ),
            ),
          ),
        )
        .toList();
    Future.delayed(const Duration(seconds: 1), () {
      isLoading = false;
      update();
    });
  }

  //////////

  // void setQuizAnswer(int selectedAnswer, QuizQuestionList question) {
  //   selectedAns = selectedAnswer;
  //   update();
  //   if (correctAnswerIndex(question) == selectedAns) {
  //     //  correct answer
  //   } else {
  //     //  wrong answer
  //   }
  // }

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
