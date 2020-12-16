import 'package:ecommerce_app/modules/login/login_screen.dart';
import 'package:ecommerce_app/modules/register/register_screen.dart';
import 'package:ecommerce_app/shared/components/components.dart';
import 'package:ecommerce_app/shared/network/remote/dio_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/shared/colors/color_common.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            headText('Welcome To courses'),
            SizedBox(
              height: 30,
            ),
            Logo(),
            SizedBox(
              height: 50,
            ),
            Button(
              text: 'login',
              borderRadius: 8,
              onPressed: () {
                navigateTo(
                  context,
                  LoginScreen(),
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            Button(
              text: 'register',
              borderRadius: 8,
              onPressed: () {
                navigateTo(context, RegisterScreen());
                // DioHelper.postData(
                //   path: 'lms/api/v1/auth/signup-save',
                //   data: {
                //     'first_name': 'Ahmed3',
                //     'last_name': 'Mansour',
                //     'email': 'Ahmed@gmail.com',
                //     'password': '123456789',
                //     'city': 'cairo',
                //   },
                // ).then((value) {
                //   print(value.data);
                // });
              },
            ),
            SizedBox(
              height: 20,
            ),
            captionText('Or login With'),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 20,
                  backgroundColor: kDefaultColor,
                  child: Image(
                    image: AssetImage(
                      'assets/images/facebook.png',
                    ),
                    height: 25,
                    width: 25,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: kDefaultColor,
                  child: Image(
                    image: AssetImage(
                      'assets/images/google.png',
                    ),
                    height: 20,
                    width: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
