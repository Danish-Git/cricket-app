import 'package:carousel_slider/carousel_controller.dart';
import 'package:cricket/home/home_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../response_dir/get_all_tournament_response.dart';

class LiveController extends GetxController {
/////////////////
  @override
  void onInit() {
    super.onInit();
    getAllTournament();
  }

  List<Widget> completeTournament = [];
  List<AllTournamentList> completeList = [];

  int completedIndex = 0;

  final CarouselController completedCarouselController = CarouselController();

  void onCompletedChange(int index) {
    completedIndex = index;
    update();
  }

  void getAllTournament() {
    HomeRepo().getALlTournamentsHome().then((value) {
      if (value.status == true) {
        GetAllTournamentResponse response =
            GetAllTournamentResponse.fromJson(value.data);

        for (var item in response.data) {
          if (item.Status == 'Complete') {
            completeList.add(item);
          }
        }
        addCompletedTournaments();
      }
    });
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

  //////////////////

  List<String> images = [
    'https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png',
    'https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png',
    'https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png',
    'https://static.javatpoint.com/tutorial/flutter/images/flutter-logo.png'
  ];
}
