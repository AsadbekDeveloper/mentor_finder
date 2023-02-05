import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentor_finder/cubit/auth_cubit.dart';
import 'package:mentor_finder/firebase_options.dart';
import 'package:mentor_finder/helper/color.dart';
import 'package:mentor_finder/screens/auth/login_page.dart';
import 'package:mentor_finder/screens/main_scaffold.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  bool isSignedIn = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      isSignedIn = true;
    }
  }

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
        home: isSignedIn ? const MainScaffold() : const LoginPage(),
        routes: {
          MainScaffold.id: (context) => const MainScaffold(),
          LoginPage.id: (context) => const LoginPage(),
        },
      ),
      designSize: const Size(390, 844),
    );
  }
}
