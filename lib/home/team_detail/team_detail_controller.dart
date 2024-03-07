import 'package:get/get.dart';

class TeamDetailController extends GetxController {
  List<int> playerList = [];

  @override
  void onReady() {
    super.onReady();
    createList();
  }

  void createList() {
    playerList = List.generate(12, (i) => i);
    update();
  }
}
