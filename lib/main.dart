import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentor_finder/helper/color.dart';
import 'package:mentor_finder/screens/main_scaffold.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
        title: 'Mentor finder',
        theme: ThemeData(
          scaffoldBackgroundColor: scaffoldColor,
          fontFamily: 'mFontsIcon',
        ),
        debugShowCheckedModeBanner: false,
        home: const MainScaffold(),
      ),
      designSize: const Size(390, 844),
    );
  }
}
