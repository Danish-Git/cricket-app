import 'package:cricket/home/response/top_runner_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../app_utils/table_bg_wgt.dart';
import '../response/top_wicket_response.dart';

const String helmet =
    'https://s3-alpha-sig.figma.com/img/325a/e8ef/858b15c5be1a72c20e47405494284738?Expires=1710115200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=OH7RmW~NoM1-tvPN98Y2Hiv7oyf33K2VRbDahXP6WK8fOQS3UeVtwb4zfSzRzouPz5S4MMnNDyIH9dD9xEUKZhgYoe32-HiNuNSwL8hiLtSD3MJAQzIkKj7ZogZ~3UZTTgHxoFnCLxwacLVLPwdcWaYO30pI66bxP6jIEr3oX~0Bes1nC60pOldisBaehAgpjQ2TPIEj7Qvvf-LhY3IMEQmLfuDl1NJsaXN2cwHL4uacRwFCTp3pRXUmUUmudKzeisjduVi7MCTwlF-8YyCc2BYuDXGm-iUeQGXkpXgc8XGMSku3467Xfh88vZazRWmC~xnxBpV0wK3vFA-2WtBvmA__';


TextStyle blackTxtStyle = const TextStyle(
  fontSize: 10,
  fontWeight: FontWeight.w600,
  color: Colors.black,
);

TextStyle txtStyle = const TextStyle(
  fontSize: 10,
  fontWeight: FontWeight.w600,
  color: Colors.white,
);

TextStyle bigTxtStyle = const TextStyle(
  fontSize: 13,
  fontWeight: FontWeight.w600,
  color: Colors.white,
);

class TopRunnerWkt extends StatelessWidget {
  final String label;
  final String txtLabel;
  final String runWkt;
  final bool isRun;
  final List<TopWktList> wktList;
  final List<TopRunList> runList;

  const TopRunnerWkt({
    super.key,
    required this.label,
    required this.txtLabel,
    required this.runWkt,
    required this.wktList,
    required this.runList,
    required this.isRun,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const TableBackWgt(),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TableTitle(label: label),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 8),
              color: Colors.white.withOpacity(0.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('        Players', style: blackTxtStyle),
                  SizedBox(width: Get.width * 0.20),
                  Text('Team', style: blackTxtStyle),
                  const SizedBox(width: 12),
                  Text(txtLabel, style: blackTxtStyle),
                  Text('     Matches', style: blackTxtStyle),
                  Text('   Innings', style: blackTxtStyle),
                ],
              ),
            ),
            Stack(
              children: [
                Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Image.network(
                    helmet,
                    width: 100,
                    height: 200,
                    fit: BoxFit.fill,
                    opacity: const AlwaysStoppedAnimation(.2),
                  ),
                ),
                SizedBox(
                  height: Get.height * 0.42,
                  child: ListView.builder(
                      itemCount: isRun ? runList.length : wktList.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (BuildContext context, int index) {
                        return TopRunnerItem(
                          index: index,
                          imgUrl: isRun
                              ? runList[index].TeamLogo
                              : wktList[index].TeamLogo,
                          playerName: isRun
                              ? runList[index].PlayerName
                              : wktList[index].PlayerName,
                          runs: isRun
                              ? runList[index].Runs
                              : wktList[index].Wicket,
                          matches: isRun
                              ? runList[index].Match
                              : wktList[index].Match,
                          innings: isRun
                              ? runList[index].Inning
                              : wktList[index].Innings,
                        );
                      }),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class PointTableItem extends StatelessWidget {
  final int index;
  final String imgUrl;
  final String countryName;
  final String matchPlayed;
  final String winMatch;
  final String lossMatch;
  final String runRate;
  final String netRunRate;
  final String pts;

  const PointTableItem({
    super.key,
    required this.index,
    required this.imgUrl,
    required this.countryName,
    required this.matchPlayed,
    required this.winMatch,
    required this.lossMatch,
    required this.runRate,
    required this.netRunRate,
    required this.pts,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 0.7),
        color: Colors.black.withOpacity(0.5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                Text('${index + 1}     ', style: txtStyle),
                Image.network(
                  imgUrl,
                  width: 37,
                  height: 28,
                  fit: BoxFit.contain,
                ),
                Text('   $countryName', style: txtStyle),
              ],
            ),
            Text(matchPlayed, style: txtStyle),
            Text(winMatch, style: txtStyle),
            Text(lossMatch, style: txtStyle),
            Text(runRate, style: txtStyle),
            Text(netRunRate, style: txtStyle),
            Container(
              width: 24,
              height: 24,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(232, 31, 66, 1),
                border: Border.all(color: Colors.white, width: 0.5),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(pts, style: txtStyle),
            )
          ],
        ),
      ),
    );
  }
}

class TopRunnerItem extends StatelessWidget {
  final int index;
  final String imgUrl;
  final String playerName;
  final String runs;
  final String matches;
  final String innings;

  const TopRunnerItem({
    super.key,
    required this.index,
    required this.imgUrl,
    required this.playerName,
    required this.runs,
    required this.matches,
    required this.innings,
  });

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
                '   ${index + 1}    $playerName',
                style: txtStyle,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
              ),
            ),
            Image.network(
              imgUrl,
              width: 36,
              height: 28,
              fit: BoxFit.contain,
            ),
            SizedBox(
              width: 40,
              child: Text(
                runs,
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
}

class OpacityHelmetImg extends StatelessWidget {
  const OpacityHelmetImg({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      bottom: 0,
      left: 0,
      right: 0,
      child: Image.network(
        helmet,
        width: 100,
        height: 200,
        fit: BoxFit.fill,
        opacity: const AlwaysStoppedAnimation(.2),
      ),
    );
  }
}
