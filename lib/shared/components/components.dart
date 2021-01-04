import 'package:ecommerce_app/shared/colors/color_common.dart';
import 'package:ecommerce_app/shared/network/remote/dio_helper.dart';
import 'package:ecommerce_app/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';

SharedPreferences preferences;

void initApp() {
  DioHelper();
}

Future<void> initPref() async {
  preferences = await SharedPreferences.getInstance();
}

Future<bool> saveToken(String token) => preferences.setString('token', token);

String getToken() => preferences.getString('token');

Future<bool> removeToken() => preferences.remove('token');

class Button extends StatelessWidget {
  final String text;
  final Function onPressed;
  final double borderRadius;

  Button({this.text, this.onPressed, this.borderRadius = 15});

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

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (Route<dynamic> route) => false);

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

void buildProgress({context, text, error = false}) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: <Widget>[
                if (!error) CircularProgressIndicator(),
                if (!error)
                  SizedBox(
                    width: 20,
                  ),
                Text(text),
              ],
            ),
            if (error)
              SizedBox(
                height: 20,
              ),
            if (error)
              Button(
                onPressed: () {
                  Navigator.pop(context);
                },
                text: 'cancel',
              )
          ],
        ),
      ),
    );

void showToast({text, bool error}) => Fluttertoast.showToast(
    msg: text.toString(),
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: error ? Colors.red : Colors.green,
    textColor: Colors.white,
    fontSize: 16.0);

class Buttons extends StatelessWidget {
  final String title;
  final Icon icon;

  Buttons({
    this.title,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text(title), icon],
        ),
      ),
    );
  }
}

class BuildSettingItem extends StatelessWidget {
  final String title;
  final Function function;

  const BuildSettingItem({this.title, this.function});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 1,
        ),
        ListTile(
          tileColor: Colors.white,
          title: Text(title),
          trailing: Icon(Icons.arrow_forward),
          onTap: function,
        ),
      ],
    );
  }
}

class BuildProfileItem extends StatelessWidget {
  final String title;
  final Widget shape;
  final Function function;

  const BuildProfileItem({this.title, this.function, this.shape});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: function,
        child: Container(
          height: 140,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 5), // changes position of shadow
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30,
                child: shape,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: black20Bold(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildCourseItem() => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, 5), // changes position of shadow
            ),
          ],
        ),
        padding: EdgeInsets.all(10),
        child: ExpansionTileCard(
          baseColor: Colors.white,
          expandedColor: Colors.white,
          elevation: 0.0,
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 25,
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Web Design',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: black16Bold(),
                          ),
                        ),
                        RatingBar.builder(
                          initialRating: 5,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 18,
                          ignoreGestures: true,
                          itemPadding: EdgeInsets.zero,
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Web DesignWeb DesignWeb DesignWeb Design',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: grey14(),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

class CategoryModel {
  String title;
  IconData iconData;
  CategoryModel({this.title, this.iconData});
}

List<CategoryModel> cat = [
  CategoryModel(title: 'Mobile Ap', iconData: Icons.list),
  CategoryModel(title: 'UI & UX', iconData: Icons.list),
  CategoryModel(title: 'Front end', iconData: Icons.list),
  CategoryModel(title: 'Back end', iconData: Icons.list),
  CategoryModel(title: 'ML', iconData: Icons.list),
  CategoryModel(title: 'AI', iconData: Icons.list),
  CategoryModel(title: 'IOT', iconData: Icons.list),
];

Widget buildSearchItem(CategoryModel model) => GestureDetector(
      onTap: () {},
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 15,
              child: Icon(
                model.iconData,
                size: 14,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              model.title,
              style: black14Bold(),
            ),
          ],
        ),
      ),
    );
