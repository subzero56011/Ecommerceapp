import 'package:conditional_builder/conditional_builder.dart';
import 'package:ecommerce_app/modules/courses/cubit/cubit.dart';
import 'package:ecommerce_app/modules/courses/cubit/states.dart';
import 'package:ecommerce_app/shared/colors/color_common.dart';
import 'package:ecommerce_app/shared/components/components.dart';
import 'package:ecommerce_app/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoursesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CoursesCubit()..getCourses(),
      child: BlocConsumer<CoursesCubit, CoursesStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var courses = CoursesCubit.get(context).courses;

          return ConditionalBuilder(
            condition: state is! CoursesStateLoading,
            builder: (context) => ConditionalBuilder(
              condition: state is! CoursesStateError,
              builder: (context) => ConditionalBuilder(
                condition: courses.length != 0,
                builder: (context) => Column(
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
                        itemBuilder: (context, index) =>
                            buildSearchItem(cat[index]),
                        separatorBuilder: (context, index) => SizedBox(
                          width: 10,
                        ),
                        itemCount: cat.length,
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                        padding: EdgeInsets.only(top: 20, bottom: 20),
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) =>
                            buildCourseItem(courses[index]),
                        separatorBuilder: (context, index) => SizedBox(
                          height: 20,
                        ),
                        itemCount: courses.length,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(),
                        if (state is! CoursesStateLoadingMore &&
                            state is! CoursesStateLoading &&
                            CoursesCubit.get(context).currentPages <=
                                CoursesCubit.get(context).totalPages)
                          MaterialButton(
                            height: 40,
                            color: kDefaultColor,
                            onPressed: () {
                              if (CoursesCubit.get(context).currentPages <=
                                  CoursesCubit.get(context).totalPages)
                                CoursesCubit.get(context).getMoreCourses();
                            },
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Load More',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.arrow_downward,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        if (state is CoursesStateLoadingMore)
                          CircularProgressIndicator()
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                fallback: (context) => Center(
                  child: Text(
                    'no courses',
                    style: black14Bold(),
                  ),
                ),
              ),
              fallback: (context) => Center(
                child: Text(
                  'error',
                  style: black14Bold(),
                ),
              ),
            ),
            fallback: (context) => Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}
