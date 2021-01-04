import 'package:bloc/bloc.dart';
import 'package:ecommerce_app/layout/cubit/states.dart';
import 'package:ecommerce_app/modules/courses/courses_screen.dart';
import 'package:ecommerce_app/modules/profile/profile_screen.dart';
import 'package:ecommerce_app/modules/search/search_screen.dart';
import 'package:ecommerce_app/modules/settings/settings_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeStateInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  var widget = [
    CoursesScreen(),
    SearchScreen(),
    ProfileScreen(),
    SettingsScreen(),
  ];

  var titles = ['Courses', 'Search', 'Profile', 'Settings'];

  int currentIndex = 0;

  changeIndex(index) {
    currentIndex = index;
    emit(HomeStateIndex());
  }
}
