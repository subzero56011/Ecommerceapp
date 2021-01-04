import 'package:ecommerce_app/shared/colors/color_common.dart';
import 'package:ecommerce_app/shared/components/components.dart';
import 'package:ecommerce_app/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Container(
            width: double.infinity,
            padding: EdgeInsetsDirectional.only(
              start: 20,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: searchController,
                    decoration: InputDecoration(
                      hintText: 'search...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  width: 60,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: kDefaultColor,
                  ),
                  child: MaterialButton(
                    height: 50,
                    onPressed: () {},
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 100,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 20),
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => buildSearchItem(cat[index]),
            separatorBuilder: (context, index) => SizedBox(
              width: 10,
            ),
            itemCount: cat.length,
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.only(top: 20),
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) => buildCourseItem(),
            separatorBuilder: (context, index) => SizedBox(
              height: 20,
            ),
            itemCount: cat.length,
          ),
        ),
      ],
    );
  }
}
