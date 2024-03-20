import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app_utils/helper.dart';
import '../app_utils/scaffold.dart';
import 'controller.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GalleryScreenController>(
      init: GalleryScreenController(),
      global: false,
      builder: (controller) {
        return CustomScaffold(
            setDefaultAppBar: true,
            titleText: controller.userImg.isEmpty ? 'Gallery' : '  ${controller.userName}',
            userImg: controller.userImg,
            body: Center(child: Helper.showError('Coming Soon'))
        );
      });
  }
}
