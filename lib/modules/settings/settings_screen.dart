import 'package:ecommerce_app/modules/welcome/welcome_screen.dart';
import 'package:ecommerce_app/shared/network/local/shared_prefrences.dart';
import 'package:flutter/cupertino.dart';
import 'package:ecommerce_app/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/modules/phone/phone_screen.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BuildSettingItem(
          title: 'Account Settings',
          function: () {},
        ),
        BuildSettingItem(
          title: 'Push Notification',
          function: () {},
        ),
        BuildSettingItem(
          title: 'Phone Authuntication',
          function: () {
            navigateTo(
              context,
              PhoneScreen(),
            );
          },
        ),
        BuildSettingItem(
          title: 'About Us',
          function: () {},
        ),
        BuildSettingItem(
          title: 'FAQ',
          function: () {},
        ),
        BuildSettingItem(
          title: 'Contact Us',
          function: () {},
        ),
        BuildSettingItem(
          title: 'Logout',
          function: () {
            removeToken().then((value) {
              navigateAndFinish(context, WelcomeScreen());
            });
          },
        ),
      ],
    );
  }
}
