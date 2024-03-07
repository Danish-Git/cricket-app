// import 'package:cricket/app_utils/table_bg_wgt.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
//
// class TestStart extends StatelessWidget {
//   const TestStart({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: TextButton(
//           onPressed: () {
//             Get.to(() => const TestScreen());
//           },
//           child: const Text('Press'),
//         ),
//       ),
//     );
//   }
// }
//
// const String helmet =
//     'https://s3-alpha-sig.figma.com/img/325a/e8ef/858b15c5be1a72c20e47405494284738?Expires=1710115200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=OH7RmW~NoM1-tvPN98Y2Hiv7oyf33K2VRbDahXP6WK8fOQS3UeVtwb4zfSzRzouPz5S4MMnNDyIH9dD9xEUKZhgYoe32-HiNuNSwL8hiLtSD3MJAQzIkKj7ZogZ~3UZTTgHxoFnCLxwacLVLPwdcWaYO30pI66bxP6jIEr3oX~0Bes1nC60pOldisBaehAgpjQ2TPIEj7Qvvf-LhY3IMEQmLfuDl1NJsaXN2cwHL4uacRwFCTp3pRXUmUUmudKzeisjduVi7MCTwlF-8YyCc2BYuDXGm-iUeQGXkpXgc8XGMSku3467Xfh88vZazRWmC~xnxBpV0wK3vFA-2WtBvmA__';
//
// const String url =
//     'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80';
//
// class TestScreen extends StatelessWidget {
//   const TestScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const SizedBox(height: 24),
//
//             Stack(
//               children: [
//                 const TableBackWgt(),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     const TableTitle(label: 'POINTS TABLE'),
//                     Container(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 4, vertical: 8),
//                       color: Colors.white.withOpacity(0.5),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           Text('    Teams', style: blackTxtStyle),
//                           SizedBox(width: Get.width * 0.18),
//                           Text('MP', style: blackTxtStyle),
//                           Text('W', style: blackTxtStyle),
//                           Text('L', style: blackTxtStyle),
//                           Text('NR', style: blackTxtStyle),
//                           Text('NRR', style: blackTxtStyle),
//                           Text('  PTS', style: blackTxtStyle),
//                         ],
//                       ),
//                     ),
//                     Stack(
//                       children: [
//                         Positioned(
//                           top: 0,
//                           bottom: 0,
//                           left: 0,
//                           right: 0,
//                           child: Image.network(
//                             helmet,
//                             width: 100,
//                             height: 200,
//                             fit: BoxFit.fill,
//                             opacity: const AlwaysStoppedAnimation(.2),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 295,
//                           child: ListView.builder(
//                               itemCount: 12,
//                               padding: EdgeInsets.zero,
//                               itemBuilder: (BuildContext context, int index) {
//                                 return PointTableItem(
//                                   index: index,
//                                   imgUrl: url,
//                                   countryName: 'NEW ZEALAND',
//                                   matchPlayed: '1',
//                                   winMatch: '1',
//                                   lossMatch: '1',
//                                   runRate: '12',
//                                   netRunRate: '+123',
//                                   pts: '4',
//                                 );
//                               }),
//                         ),
//                       ],
//                     ),
//                   ],
//                 )
//               ],
//             ),
//
//             //////////
//
//             const SizedBox(height: 24),
//
//             //////////  for top runner
//             const TopRunnerWkt(label: 'TOP RUNNER', txtLabel: 'Runs'),
//
//             const SizedBox(height: 24),
//             //////////  for top wickets
//             ///////// in case wickets runs = '12    '
//             const TopRunnerWkt(label: 'WICKETS', txtLabel: 'Wickets'),
//
//             const SizedBox(height: 24),
//             //////////  for winner
//             Stack(
//               children: [
//                 const TableBackWgt(),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     const TableTitle(label: 'WINNER'),
//                     Container(
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Colors.black, width: 0.7),
//                         color: Colors.black.withOpacity(0.5),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Image.network(
//                             url,
//                             width: 60,
//                             height: 60,
//                             fit: BoxFit.contain,
//                           ),
//                           const Text(
//                             '   NEW ZEALAND*',
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.white,
//                             ),
//                           )
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//                 Positioned(
//                   top: 0,
//                   bottom: 0,
//                   left: 0,
//                   right: 0,
//                   child: Image.network(
//                     helmet,
//                     width: 100,
//                     height: 200,
//                     fit: BoxFit.cover,
//                     opacity: const AlwaysStoppedAnimation(.2),
//                   ),
//                 ),
//               ],
//             ),
//
//             //////////  playing teams
//
//             Stack(
//               children: [
//                 const TableBackWgt(),
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     const TableTitle(label: 'PLAYING TEAMS'),
//                     Container(
//                       width: double.infinity,
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 4, vertical: 12),
//                       color: Colors.white.withOpacity(0.5),
//                       child:
//                           Text('   No.of teams playing', style: blackTxtStyle),
//                     ),
//                     Stack(
//                       children: [
//                         Positioned(
//                           top: 0,
//                           bottom: 0,
//                           left: 0,
//                           right: 0,
//                           child: Image.network(
//                             helmet,
//                             width: 200,
//                             height: 300,
//                             fit: BoxFit.cover,
//                             opacity: const AlwaysStoppedAnimation(.2),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 285,
//                           child: ListView.builder(
//                               itemCount: 9,
//                               padding: EdgeInsets.zero,
//                               itemBuilder: (BuildContext context, int index) {
//                                 return DecoratedBox(
//                                   decoration: BoxDecoration(
//                                     border: Border.all(
//                                         color: Colors.black, width: 0.7),
//                                     color: Colors.black.withOpacity(0.5),
//                                   ),
//                                   child: Row(
//                                     children: [
//                                       Text('         ${index + 1}        ',
//                                           style: txtStyle),
//                                       Image.network(
//                                         url,
//                                         width: 40,
//                                         height: 40,
//                                         fit: BoxFit.contain,
//                                       ),
//                                       Text('     INDIA', style: txtStyle),
//                                     ],
//                                   ),
//                                 );
//                               }),
//                         ),
//                       ],
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// TextStyle blackTxtStyle = const TextStyle(
//   fontSize: 10,
//   fontWeight: FontWeight.w600,
//   color: Colors.black,
// );
//
// TextStyle txtStyle = const TextStyle(
//   fontSize: 10,
//   fontWeight: FontWeight.w600,
//   color: Colors.white,
// );
//
// TextStyle bigTxtStyle = const TextStyle(
//   fontSize: 15,
//   fontWeight: FontWeight.w600,
//   color: Colors.white,
// );
//
// class TopRunnerWkt extends StatelessWidget {
//   final String label;
//   final String txtLabel;
//
//   const TopRunnerWkt({super.key, required this.label, required this.txtLabel});
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         const TableBackWgt(),
//         Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             TableTitle(label: label),
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
//               color: Colors.white.withOpacity(0.5),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                 children: [
//                   Text('     Players', style: blackTxtStyle),
//                   SizedBox(width: Get.width * 0.13),
//                   Text('Team', style: blackTxtStyle),
//                   const SizedBox(width: 24),
//                   Text('Runs', style: blackTxtStyle),
//                   Text('         Matches', style: blackTxtStyle),
//                   Text('   Innings', style: blackTxtStyle),
//                 ],
//               ),
//             ),
//             Stack(
//               children: [
//                 Positioned(
//                   top: 0,
//                   bottom: 0,
//                   left: 0,
//                   right: 0,
//                   child: Image.network(
//                     helmet,
//                     width: 100,
//                     height: 200,
//                     fit: BoxFit.fill,
//                     opacity: const AlwaysStoppedAnimation(.2),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 295,
//                   child: ListView.builder(
//                       itemCount: 12,
//                       padding: EdgeInsets.zero,
//                       itemBuilder: (BuildContext context, int index) {
//                         return TopRunnerItem(
//                           index: index,
//                           imgUrl: url,
//                           playerName: 'Tester Test',
//                           runs: '35367',
//                           matches: '7',
//                           innings: '77',
//                         );
//                       }),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
//
// class PointTableItem extends StatelessWidget {
//   final int index;
//   final String imgUrl;
//   final String countryName;
//   final String matchPlayed;
//   final String winMatch;
//   final String lossMatch;
//   final String runRate;
//   final String netRunRate;
//   final String pts;
//
//   const PointTableItem({
//     super.key,
//     required this.index,
//     required this.imgUrl,
//     required this.countryName,
//     required this.matchPlayed,
//     required this.winMatch,
//     required this.lossMatch,
//     required this.runRate,
//     required this.netRunRate,
//     required this.pts,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return DecoratedBox(
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.black, width: 0.7),
//         color: Colors.black.withOpacity(0.5),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           Row(
//             children: [
//               Text('${index + 1}     ', style: txtStyle),
//               Image.network(
//                 imgUrl,
//                 width: 40,
//                 height: 40,
//                 fit: BoxFit.contain,
//               ),
//               Text('   $countryName', style: txtStyle),
//             ],
//           ),
//           Text(matchPlayed, style: txtStyle),
//           Text(winMatch, style: txtStyle),
//           Text(lossMatch, style: txtStyle),
//           Text(runRate, style: txtStyle),
//           Text(netRunRate, style: txtStyle),
//           Container(
//             width: 24,
//             height: 24,
//             alignment: Alignment.center,
//             decoration: BoxDecoration(
//               color: const Color.fromRGBO(232, 31, 66, 1),
//               border: Border.all(color: Colors.white, width: 0.5),
//               borderRadius: BorderRadius.circular(6),
//             ),
//             child: Text(pts, style: txtStyle),
//           )
//         ],
//       ),
//     );
//   }
// }
//
// class TopRunnerItem extends StatelessWidget {
//   final int index;
//   final String imgUrl;
//   final String playerName;
//   final String runs;
//   final String matches;
//   final String innings;
//
//   const TopRunnerItem({
//     super.key,
//     required this.index,
//     required this.imgUrl,
//     required this.playerName,
//     required this.runs,
//     required this.matches,
//     required this.innings,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return DecoratedBox(
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.black, width: 0.7),
//         color: Colors.black.withOpacity(0.5),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceAround,
//         children: [
//           Text('${index + 1}    $playerName', style: txtStyle),
//           SizedBox(
//             width: 38,
//             height: 40,
//             child: Image.network(
//               imgUrl,
//               width: 40,
//               height: 40,
//               fit: BoxFit.contain,
//             ),
//           ),
//           Text(runs, style: index == 0 ? bigTxtStyle : txtStyle),
//           Text(matches, style: txtStyle),
//           Text('$innings  ', style: txtStyle),
//         ],
//       ),
//     );
//   }
// }
