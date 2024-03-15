import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final Widget? backgroundImage;
  final Widget? titleWidget;
  final bool? centerTitle;
  final Widget? leadingWidget;
  final Widget? body;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;

  const CustomScaffold({
    Key? key,
    this.backgroundImage,
    this.titleWidget,
    this.centerTitle,
    this.leadingWidget,
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
            child: backgroundImage,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: titleWidget,
              centerTitle: centerTitle,
              leading: leadingWidget,
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