import 'package:ecommerce_app/modules/register/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:ecommerce_app/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_app/modules/forgot_password/forgot_password_screen.dart';

class LoginScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              SingleChildScrollView(
                child: Logo(),
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  DefaultTextForm(
                    title: 'Email',
                    hint: 'enter your email',
                    type: TextInputType.emailAddress,
                    controller: emailController,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  DefaultTextForm(
                    title: 'Password',
                    hint: 'enter your Password',
                    type: TextInputType.visiblePassword,
                    controller: passwordController,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Button(
                    text: 'login',
                    borderRadius: 15,
                    onPressed: null,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Button(
                    text: 'rigster',
                    borderRadius: 15,
                    onPressed: () {
                      navigateTo(context, RegisterScreen());
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      navigateTo(context, ForgotPassword());
                    },
                    child: captionText('forgot your password?'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
