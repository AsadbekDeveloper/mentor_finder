// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:mentor_finder/helper/color.dart';
import 'package:mentor_finder/helper/text.dart';

import 'profile_button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final User? user;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    user = FirebaseAuth.instance.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 200.w,
                padding: const EdgeInsets.all(20),
                child: ClipOval(
                  child: Image.asset('assets/icons/mentor.jpg'),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Asadbek Janabaev',
                style: h2,
              ),
              const SizedBox(height: 5),
              Text(
                '@watcherOnWall',
                style: b3,
              ),
            ],
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            decoration: BoxDecoration(
              color: mainwhite,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                const ProfileButton(
                  title: 'Settings',
                  icon: Icons.settings,
                ),
                const ProfileButton(
                  title: 'Billing Details',
                  icon: Icons.card_giftcard,
                ),
                const ProfileButton(
                  title: 'User Management',
                  icon: Icons.person,
                ),
                Divider(
                  height: 20,
                  thickness: 1,
                  color: maingrey.withOpacity(0.3),
                ),
                const ProfileButton(
                  title: 'Information',
                  icon: Icons.info,
                ),
                const ProfileButton(
                  title: 'Log Out',
                  icon: Icons.arrow_right_alt_rounded,
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
