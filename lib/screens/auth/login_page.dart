import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mentor_finder/helper/color.dart';
import 'package:mentor_finder/screens/auth/cubit/auth_cubit.dart';
import 'package:mentor_finder/screens/main_scaffold.dart';

class LoginPage extends StatelessWidget {
  static String id = 'login';

  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 150.w,
                  child: Image.asset('assets/images/MFlogo.png'),
                ),
                const SizedBox(height: 50),
                _signInButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _signInButton() {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: mainwhite,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          ),
          onPressed: () {
            context.read<AuthCubit>().signInWithGoogle().then((result) {
              if (result != null) {
                Navigator.of(context).pushNamed(MainScaffold.id);
              }
            });
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Image(
                    image: AssetImage("assets/images/google.png"),
                    height: 35.0),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Google bilan tizimga kiring',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
