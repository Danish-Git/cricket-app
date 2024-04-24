import 'package:carousel_slider/carousel_controller.dart';
import 'package:cricket/home/response/playing_team_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app_utils/constants/navigation_params.dart';
import '../../../response_dir/tournament_model.dart';
import '../../../ui_models/tab_bar_model.dart';

class TournamentDetailController extends GetxController {

  int selectedDetailPages = 0;

  bool isLoading = true;

  TournamentModel? tournament = Get.arguments?[NavParamsConstants.tournament];

  List<TabBarModel> detailPageList = [
    TabBarModel(id: '0', label: 'Match', isSelected: false),
    TabBarModel(id: '1', label: 'Point Table', isSelected: false),
    TabBarModel(id: '2', label: 'Top Runner', isSelected: false),
    TabBarModel(id: '3', label: 'Wickets', isSelected: false),
    TabBarModel(id: '4', label: 'Winners', isSelected: false),
    TabBarModel(id: '5', label: 'Playing\nTeams', isSelected: false),
  ];

  @override
  void onInit() {
    super.onInit();
    initData();
  }

  void initData() {
    detailPageList[selectedDetailPages].isSelected = true;
  }

  void onDetailPageChange(TabBarModel detailPage) {
    int selectedIndex = 0;
    for (int i = 0; i < detailPageList.length; i++) {
      final status = detailPageList[i];
      status.isSelected = (status == detailPage);
      if (status.isSelected ?? false) {
        selectedIndex = i;
      }
    }
    selectedDetailPages = selectedIndex;
    update();
  }

  /////////  function for getting winners

  // List<PointsTableData> winnerList = [];

  /*void getWinner() {
    pointsTableData.clear();
    _homeRepo.getPointsTableHomeApi().then((value) {
      Get.back();
      if (value.status == true) {
        PointsTableResponse response = PointsTableResponse.fromJson(value.data);
        pointsTableData.addAll(response.data);
        update();
      }
    });
  }*/

  /////////  function for getting playing team

  List<PlayingTeamList> playingTeamList = [];

  /*void getPlayingTeam() {
    _homeRepo.getPlayingTeamHomeApi().then((value) {
      Get.back();
      if (value.status == true) {
        PlayingTeamResponse response = PlayingTeamResponse.fromJson(value.data);
        playingTeamList.addAll(response.data);
        update();
      }
    });
  }*/

  /////////  function for getting playing team

  // List<PointsTableData> mostBoundaries = [];

  /*void getBoundaries() {
    _homeRepo.getPointsTableHomeApi().then((value) {
      Get.back();
      if (value.status == true) {
        PointsTableResponse response = PointsTableResponse.fromJson(value.data);
        pointsTableData.addAll(response.data);
        update();
      }
    });
  }*/
}
