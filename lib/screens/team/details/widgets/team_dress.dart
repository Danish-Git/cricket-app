import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeamDress extends StatelessWidget {
  const TeamDress({
    super.key,
    this.teamDressUrl
  });

  final String? teamDressUrl;

  @override
  Widget build(BuildContext context) {
    if(teamDressUrl?.isEmpty ?? true) {
      return const SizedBox.shrink();
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Text(
              'Team dress',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            height: 170,
            padding: const EdgeInsets.only(left: 12, right: 12),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(247, 247, 247, 1),
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: const Color.fromRGBO(0, 116, 56, 0.2),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: Get.width * 0.37,
                  height: 150,
                  child: Image.network(
                    teamDressUrl ?? '',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: Get.width * 0.37,
                  height: 150,
                  child: Image.network(
                    teamDressUrl ?? '',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }
  }
}
