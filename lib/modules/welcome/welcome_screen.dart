import 'package:ecommerce_app/layout/cubit/cubit.dart';
import 'package:ecommerce_app/modules/login/login_screen.dart';
import 'package:ecommerce_app/modules/phone/phone_screen.dart';
import 'package:ecommerce_app/modules/register/register_screen.dart';
import 'package:ecommerce_app/shared/components/components.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/shared/colors/color_common.dart';
import 'package:google_sign_in/google_sign_in.dart';

class WelcomeScreen extends StatelessWidget {
  GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // headText('Learn It!'),

            Logo(),
            SizedBox(
              height: 125,
            ),
            Button(
              text: 'login',
              borderRadius: 8,
              onPressed: () {
                navigateTo(
                  context,
                  LoginScreen(),
                );
                // HomeCubit.get(context).sendNotification();
              },
            ),
            SizedBox(
              height: 25,
            ),
            Button(
              text: 'register',
              borderRadius: 8,
              onPressed: () {
                navigateTo(context, RegisterScreen());

                //test firebase notification through apis
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
              height: 75,
            ),
            captionText('Or login With'),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 25,
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
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {
                    handleSignIn();
                  },
                  child: CircleAvatar(
                    radius: 25,
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
                ),
                SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {
                    navigateTo(context, PhoneScreen());
                  },
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: kDefaultColor,
                    child: Image(
                      image: AssetImage(
                        'assets/images/call.png',
                      ),
                      height: 20,
                      width: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> handleSignIn() async {
    await googleSignIn.signIn().then((value) async {
      print(value.email);
      print(value.displayName);
      print(value.photoUrl);

      GoogleSignInAuthentication googleSignInAuthentication =
          await value.authentication;

      AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) {
        print(value.user.uid);
      }).catchError((e) {
        print(e.toString());
      });
    }).catchError((e) {
      print(e.toString());
    });
  }
}
