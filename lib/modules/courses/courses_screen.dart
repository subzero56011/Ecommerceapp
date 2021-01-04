import 'package:ecommerce_app/shared/components/components.dart';
import 'package:flutter/material.dart';

class CoursesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 15,
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
