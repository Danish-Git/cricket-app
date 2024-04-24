import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper.dart';
import 'controller.dart';


class AdsSlider extends StatelessWidget {
  const AdsSlider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdsSliderController>(
      init: AdsSliderController(),
      global: false,
      builder: (controller) => controller.adsList.isEmpty
        ? Center(child: Helper.showLoader())
        : Column(
        children: [
          CarouselSlider.builder(
              carouselController: controller.carouselController,
              options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 2.3,
                  onPageChanged: controller.onPageChanged),
              itemCount: controller.adsList.length,
              itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
                  Material(
                    child: InkWell(
                      onTap: () => controller.loadAdd(controller.adsList[itemIndex]),
                      child: Container(
                        height: 180,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          borderRadius:  BorderRadius.circular(15),
                        ),
                        child: ClipRRect(
                          borderRadius:  BorderRadius.circular(15),
                          child: Image.network(
                            controller.adsList[itemIndex].bannerURL ?? '',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: controller.adsList.asMap().entries.map((entry) {
              return InkWell(
                onTap: () => controller.carouselController.animateToPage(entry.key),
                child: Container(width: 8, height: 8,
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (Theme.of(context).brightness == Brightness.dark
                          ? Colors.white : Colors.black).withOpacity(controller.currentCarousel == entry.key ? 0.9 : 0.4)),
                ),
              );
            }).toList(),),
        ],
      )
    );
  }
}
