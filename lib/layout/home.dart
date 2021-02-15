import 'package:ecommerce_app/layout/cubit/cubit.dart';
import 'package:ecommerce_app/shared/colors/color_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

import 'cubit/states.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var currentIndex = HomeCubit.get(context).currentIndex;

        return Scaffold(
          appBar: AppBar(
            // backgroundColor: Colors.white.withOpacity(0.1),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  HomeCubit.get(context).titles[currentIndex],
                ),
              ],
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.notifications),
                onPressed: () {
                  HomeCubit.get(context).sendNotification();
                },
              ),
            ],
          ),
          body: HomeCubit.get(context).widget[currentIndex],
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 5), // changes position of shadow
                ),
              ],
            ),
            child: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                    icon: Image(
                      image: AssetImage('assets/images/cap.png'),
                      height: 20,
                    ),
                    label: 'courses'),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: 'search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(OMIcons.person),
                  label: 'profile',
                ),
                BottomNavigationBarItem(
                  icon: Icon(OMIcons.settings),
                  label: 'settings',
                ),
              ],
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: kDefaultColor,
              currentIndex: currentIndex,
              onTap: (index) {
                HomeCubit.get(context).changeIndex(index);
              },
            ),
          ),
        );
      },
    );
  }
}
