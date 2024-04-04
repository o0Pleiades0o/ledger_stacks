import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ledger_stacks/util/root.dart';

import '../constants/color.dart';
import 'auth/bindings/auth_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
    apiKey: "AIzaSyDSbHMF9B6XwxyyDeEaYKYo88_989K3LNA",
    appId: "1:471169727193:android:cf6463a78832addfacdcc8",
    messagingSenderId: "471169727193",
    projectId: "ledgerstacks-2f9e6",
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return GetMaterialApp(
            initialBinding: AuthBinding(),
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: kViolet),
              useMaterial3: true,
            ),
            home: const Root(),
          );
        });
  }
}
