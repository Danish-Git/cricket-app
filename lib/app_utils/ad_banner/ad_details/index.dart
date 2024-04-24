import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/ads.dart';
import 'controller.dart';

class AdDialogue extends StatelessWidget {
  const AdDialogue({
    key,
    required this.adModel
  }) : super(key: key);

  final AdsModel adModel;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AdDialogueController>(
        global: false,
        init: AdDialogueController(),
        builder: (controller) {
          return Container();
          // return Container(
          //   width: double.maxFinite,
          //   margin: const EdgeInsets.symmetric(horizontal: 10),
          //   decoration: const BoxDecoration(
          //       color: ICMColor.white,
          //       borderRadius: BorderRadius.only(
          //         topLeft: Radius.circular(15),
          //         topRight: Radius.circular(15),
          //       )
          //   ),
          //   child: Column(
          //     mainAxisSize: MainAxisSize.min,
          //     children: [
          //       Stack(
          //         children: [
          //           const Positioned.fill(
          //             child: Align(
          //               alignment: Alignment.center,
          //               child: ICMText(
          //                 text: "Ad",
          //                 textSize: ICMTextSize.heading2,
          //                 fontWeight: FontWeight.bold,
          //               ),
          //             ),
          //           ),
          //           Row(
          //             mainAxisAlignment: MainAxisAlignment.end,
          //             crossAxisAlignment: CrossAxisAlignment.end,
          //             children: [
          //               ICMIconButton(
          //                 onTap: () => Get.back(),
          //                 icon: Icons.close,
          //                 size: 25,
          //                 color: ICMColor.primeTextColor,
          //               )
          //             ],
          //           )
          //         ],
          //       ),
          //
          //       Padding(
          //         padding: const EdgeInsets.symmetric(horizontal: 20),
          //         child: AspectRatio(
          //           aspectRatio: 16/9,
          //           child: ICMNetworkImage(
          //             imageType: ImageType.banner,
          //             imagePath: banner.banner,
          //             width: double.maxFinite,
          //           ),
          //         ),
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          //         child: Column(
          //           mainAxisAlignment: MainAxisAlignment.start,
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             details(title: "Shop :", description: banner.shopName),
          //             details(title: "Category :", description: banner.categoryName),
          //             details(title: "Product :", description: banner.productsTypeTitle),
          //           ],
          //         ),
          //       )
          //
          //     ],
          //   ),
          // );
        });
  }

  // Widget details({String? title, String? description}) {
  //   return Padding(
  //     padding: const EdgeInsets.only(top: 10),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.start,
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: [
  //         ICMText(
  //           text: title ?? "Title",
  //           textSize: ICMTextSize.heading3,
  //           fontWeight: FontWeight.bold,
  //         ),
  //         Padding(
  //           padding: const EdgeInsets.only(left: 10),
  //           child: ICMText(
  //             text: description ?? "Description",
  //             textSize: ICMTextSize.heading3,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

}