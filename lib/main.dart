import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'routing_dir/app_screen_const.dart';
import 'routing_dir/screen_route.dart';

GetStorage storagePrefBox = GetStorage();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();

  await FirebaseMessaging.instance.requestPermission(
    alert: true,
    badge: true,
    sound: true,
    provisional: true,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color.fromRGBO(0, 116, 56, 1),
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return GetMaterialApp(
      title: 'Cricket',
      debugShowCheckedModeBanner: false,
      initialRoute: AppScreenConst.splash,
      getPages: AppPages.pages,
      theme: ThemeData(colorSchemeSeed: Colors.green),
    );
  }
}
