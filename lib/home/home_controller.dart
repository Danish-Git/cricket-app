import 'package:carousel_slider/carousel_controller.dart';
import 'package:cricket/home/response/quiz_question_response.dart';
import 'package:cricket/routing_dir/app_screen_const.dart';
import 'package:cricket/user_profile/UserProfileRepo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../user_profile/user_profile_response.dart';
import 'home_repo.dart';
import '../response_dir/get_all_tournament_response.dart';
import 'response/notification_response.dart';
import 'package:timeago/timeago.dart' as timeAgo;

class HomeController extends GetxController {
  final HomeRepo _homeRepo = HomeRepo();

  bool isLoading = true;

  @override
  void onInit() {
    super.onInit();
    quizQuestion();
    getUserDetail();
  }

  String userName = '';
  String userImg = '';

  void getUserDetail() {
    UserProfileRepo().getUserProfile(number: '0123456789').then((value) {
      if (value.status) {
        UserProfileResponse response = UserProfileResponse.fromJson(value.data);
        userName = response.data[0].UserName;
        userImg = response.data[0].ProfilePicture;
      }
    });
  }

  List<QuizQuestionList> questionList = [];

  int selectedAns = 9;

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
            mobile: '7087359973', quizId: id, answer: answer)
        .then((value) {
      if (value.status) {
        print(value.message.toString());
      }
    });
  }

  ////////

  int upComingIndex = 0;
  int runningIndex = 0;
  int completedIndex = 0;
  int cancelIndex = 0;

  final CarouselController upComingCarouselController = CarouselController();
  final CarouselController runningCarouselController = CarouselController();
  final CarouselController completedCarouselController = CarouselController();
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

  void onCancelChange(int index) {
    cancelIndex = index;
    update();
  }

  @override
  void onReady() {
    super.onReady();
    getAllNotifications();
    getAllTournament();
  }

  List<Widget> upComingTournament = [];
  List<Widget> runningTournament = [];
  List<Widget> completeTournament = [];
  List<Widget> cancelTournament = [];

  /////

  List<AllTournamentList> upComingList = [];
  List<AllTournamentList> runningList = [];
  List<AllTournamentList> completeList = [];
  List<AllTournamentList> cancelList = [];

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

/////  ON NOTIFICATION TAP

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

  void onNotificationTap() {
    Get.bottomSheet(
      isDismissible: true,
      enableDrag: true,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
        side: BorderSide(width: 1, color: Colors.transparent),
      ),
      Container(
        height: Get.height * 0.8,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30.0)),
        ),
        child: Column(
          children: [
            Container(
              height: 5,
              width: 40,
              margin: const EdgeInsets.only(top: 16),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(60, 60, 67, 0.3),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Notifications',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(0, 0, 0, 1),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: notificationList.length,
                itemBuilder: (BuildContext context, int index) {
                  return NotificationItem(
                    index: index,
                    notificationTitle: notificationList[index].Notification,
                    dateTime:
                        timeAgoFun(notificationList[index].NotificationDT),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  //////////

  final iconList = <IconData>[
    Icons.home,
    Icons.live_tv,
    Icons.browse_gallery,
    Icons.person,
  ];
}

String timeAgoFun(String data) {
  return timeAgo.format(DateTime.parse(data), locale: 'en_short');
}

class NotificationItem extends StatelessWidget {
  final String notificationTitle;
  final int index;
  final String dateTime;

  const NotificationItem({
    super.key,
    required this.notificationTitle,
    required this.index,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.03)),
        ),
      ),
      child: ListTile(
        tileColor: const Color.fromRGBO(0, 0, 0, 0.03),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        leading: Container(
          height: 48,
          width: 48,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(226, 232, 240, 1),
            shape: BoxShape.circle,
          ),
          child: const Text(
            'AB',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(115, 131, 155, 1),
            ),
          ),
        ),
        title: Text(
          notificationTitle,
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(51, 65, 85, 1),
          ),
        ),
        trailing: Text(
          dateTime,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Color.fromRGBO(71, 85, 105, 1),
          ),
        ),
      ),
    );
  }
}
