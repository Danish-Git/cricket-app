import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'default_appbar.dart';

class CustomScaffold extends StatelessWidget {
  final Widget? backgroundImage;
  final bool? setDefaultAppBar;
  final Widget? titleWidget;
  final String? titleText;
  final String? userImg;
  final bool? centerTitle;
  final Widget? leadingWidget;
  final List<Widget>? actions;
  final Widget? body;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  const CustomScaffold({
    Key? key,
    this.setDefaultAppBar = false,
    this.backgroundImage,
    this.titleWidget,
    this.titleText,
    this.userImg,
    this.centerTitle,
    this.leadingWidget,
    this.actions,
    this.body,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Container(
            width: double.maxFinite,
            height: double.maxFinite,
            color: Colors.white,
          ),
          Container(
            width: double.maxFinite,
            color: Colors.white,
            child: backgroundImage ?? SvgPicture.asset(
            'assets/down_dot.svg',
            fit: BoxFit.fill,
          ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: setDefaultAppBar ?? false ? defaultAppBar(titleText: titleText ?? 'Cricket Club', userImg: userImg ?? '')
            : AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: titleWidget,
              centerTitle: centerTitle,
              leading: leadingWidget,
              actions: actions,
            ),
            body: body,
            floatingActionButton: floatingActionButton,
            floatingActionButtonLocation: floatingActionButtonLocation,
          ),
        ],
      ),
    );
  }
}