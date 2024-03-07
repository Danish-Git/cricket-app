import 'package:carousel_slider/carousel_controller.dart';
import 'package:cricket/app_utils/loader_message_utils.dart';
import 'package:cricket/home/response/playing_team_response.dart';
import 'package:cricket/home/response/points_table_response.dart';
import 'package:cricket/home/response/top_runner_response.dart';
import 'package:cricket/home/response/tournament_match_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home_repo.dart';
import '../response/top_wicket_response.dart';

class MatchDetailController extends GetxController {
  final HomeRepo _homeRepo = HomeRepo();

  bool isLoading = true;

  @override
  void onInit() {
    super.onInit();
    getAllMatches();
  }

  int upComingIndex = 1;

  final CarouselController upComingCarouselController = CarouselController();

  List<Widget> upComingTournament = [];

  void onUpComingChange(int index) {
    upComingIndex = index;
    update();
  }

  List<TournamentMatchList> tournamentList = [];

  void getAllMatches() {
    tournamentList.clear();
    _homeRepo.getALlTournamentsMatches().then((value) {
      if (value.status == true) {
        TournamentMatchesResponse response =
            TournamentMatchesResponse.fromJson(value.data);
        tournamentList.addAll(response.data);
        addUpComingTournaments();
      }
    });
  }

  void addUpComingTournaments() {
    upComingTournament = tournamentList
        .map((item) => Container(
              margin: const EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  item.MatchBanner,
                  fit: BoxFit.cover,
                  width: 1000,
                ),
              ),
            ))
        .toList();

    if (isLoading) {
      isLoading = false;
      update();
    } else {
      Get.back();
      update();
    }
  }

  int currentSelectedIndex = 0;

  void onTapChip(int index) {
    if (currentSelectedIndex == index) {
      return;
    }
    currentSelectedIndex = index;

    showLoaderDialog();

    switch (index) {
      case 0:
        getAllMatches();
        break;

      case 1:
        getPointsTable();
        break;

      case 2:
        getTopRunner();
        break;

      case 3:
        getTopWickets();
        break;

      case 4:
        getWinner();
        break;

      case 5:
        getPlayingTeam();
        break;

      case 6:
        getBoundaries();
        break;
    }
  }

  /////////  function for getting points table

  List<PointsTableData> pointsTableData = [];

  void getPointsTable() {
    pointsTableData.clear();
    _homeRepo.getPointsTableHomeApi().then((value) {
      Get.back();
      if (value.status == true) {
        PointsTableResponse response = PointsTableResponse.fromJson(value.data);
        pointsTableData.addAll(response.data);
        update();
      }
    });
  }

  /////////  function for getting top runner

  List<TopRunList> topRunnerList = [];

  void getTopRunner() {
    topRunnerList.clear();
    _homeRepo.getTopRunnerHomeApi().then((value) {
      Get.back();
      if (value.status == true) {
        TopRunResponse response = TopRunResponse.fromJson(value.data);
        topRunnerList.addAll(response.data);
        update();
      }
    });
  }

  /////////  function for getting top wickets

  List<TopWktList> topWicketsList = [];

  void getTopWickets() {
    topWicketsList.clear();
    _homeRepo.getTopWicketsHomeApi().then((value) {
      Get.back();
      if (value.status == true) {
        TopWicketResponse response = TopWicketResponse.fromJson(value.data);
        topWicketsList.addAll(response.data);
        update();
      }
    });
  }

  /////////  function for getting winners

  List<PointsTableData> winnerList = [];

  void getWinner() {
    pointsTableData.clear();
    _homeRepo.getPointsTableHomeApi().then((value) {
      Get.back();
      if (value.status == true) {
        PointsTableResponse response = PointsTableResponse.fromJson(value.data);
        pointsTableData.addAll(response.data);
        update();
      }
    });
  }

  /////////  function for getting playing team

  List<PlayingTeamList> playingTeamList = [];

  void getPlayingTeam() {
    _homeRepo.getPlayingTeamHomeApi().then((value) {
      Get.back();
      if (value.status == true) {
        PlayingTeamResponse response = PlayingTeamResponse.fromJson(value.data);
        playingTeamList.addAll(response.data);
        update();
      }
    });
  }

  /////////  function for getting playing team

  List<PointsTableData> mostBoundaries = [];

  void getBoundaries() {
    _homeRepo.getPointsTableHomeApi().then((value) {
      Get.back();
      if (value.status == true) {
        PointsTableResponse response = PointsTableResponse.fromJson(value.data);
        pointsTableData.addAll(response.data);
        update();
      }
    });
  }
}
