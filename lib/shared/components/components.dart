import 'package:ecommerce_app/shared/colors/color_common.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final Function onPressed;
  final double borderRadius;

  Button({this.text, this.onPressed, this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: kDefaultColor,
      ),
      width: double.infinity,
      height: 40,
      child: FlatButton(
        onPressed: onPressed,
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

Widget headText(String text) => Text(
      text,
      style: TextStyle(fontSize: 25),
    );

Widget captionText(String text) => Text(
      text,
      style: TextStyle(fontSize: 16),
    );

Widget detailsText(String text) => Text(
      text,
      style: TextStyle(
        fontSize: 14.0,
      ),
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

class DefaultTextForm extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String hint;
  final type;

  DefaultTextForm({
    this.title,
    this.hint,
    this.type,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0), color: Colors.white),
      padding: EdgeInsetsDirectional.only(start: 10, end: 10, top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          detailsText(title),
          TextFormField(
            controller: controller,
            keyboardType: type,
            decoration: InputDecoration(
              hintText: hint,
              border: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }
}

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      child: Image(
        image: AssetImage('assets/images/Untitled-1.png'),
      ),
    );
  }
}
