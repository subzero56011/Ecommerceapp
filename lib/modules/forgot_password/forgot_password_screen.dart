import 'package:flutter/material.dart';
import 'package:ecommerce_app/shared/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class ForgotPassword extends StatelessWidget {
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              headText('Forgot Password'),
              SizedBox(
                height: 180.0,
              ),
              DefaultTextForm(
                title: 'Email',
                hint: 'enter your email',
                type: TextInputType.emailAddress,
                controller: emailController,
              ),
              SizedBox(
                height: 160,
              ),
              Button(
                text: 'Send reset code',
                borderRadius: 15,
                onPressed: null,
              ),
              SizedBox(
                height: 20,
              ),
              Button(
                text: 'login',
                borderRadius: 15,
                onPressed: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
