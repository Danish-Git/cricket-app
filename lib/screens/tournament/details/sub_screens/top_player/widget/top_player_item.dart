import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopPlayerItem extends StatelessWidget {

  const TopPlayerItem({
    Key? key,
    this.index,
    this.imgUrl,
    this.playerName,
    this.runs,
    this.matches,
    this.innings,
  }) : super(key: key);

  final int? index;
  final String? imgUrl;
  final String? playerName;
  final String? runs;
  final String? matches;
  final String? innings;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 0.7),
        color: Colors.black.withOpacity(0.5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: Get.width * 0.3,
              child: Text(
                '   ${index ?? 0 + 1}    $playerName',
                style: txtStyle,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
              ),
            ),
            Image.network(
              imgUrl ?? '',
              width: 36,
              height: 28,
              fit: BoxFit.contain,
            ),
            SizedBox(
              width: 40,
              child: Text(
                runs ?? '',
                style: index == 0 ? bigTxtStyle : txtStyle,
                textAlign: TextAlign.start,
              ),
            ),
            Text('$matches    ', style: txtStyle),
            Text('$innings       ', style: txtStyle),
          ],
        ),
      ),
    );
  }

  final TextStyle blackTxtStyle = const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

  final TextStyle txtStyle = const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  final TextStyle bigTxtStyle = const TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
}