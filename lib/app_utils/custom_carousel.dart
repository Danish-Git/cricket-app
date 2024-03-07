import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarousel extends StatelessWidget {
  final double boxHgt;
  final double boxWdt;
  final List<Widget> itemList;
  final int index;
  final CarouselController carouselController;
  final dynamic Function(int, CarouselPageChangedReason)? onPageChanged;

  const CustomCarousel({
    super.key,
    required this.boxHgt,
    required this.boxWdt,
    required this.itemList,
    required this.index,
    required this.carouselController,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: boxHgt,
      width: boxWdt,
      child: Stack(
        children: [
          CarouselSlider(
            items: itemList,
            carouselController: carouselController,
            options: CarouselOptions(
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 2),
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  onPageChanged!(index, reason);
                }),
          ),
          Positioned(
            bottom: 12,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: itemList.asMap().entries.map((entry) {
                return Container(
                  width: 20,
                  height: 5,
                  margin: const EdgeInsets.only(left: 4, bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(
                      index == entry.key ? 1 : 0.5,
                    ),
                    borderRadius: BorderRadius.circular(11),
                  ),
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
