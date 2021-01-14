import 'package:ecommerce_app/modules/courses/cubit/states.dart';
import 'package:ecommerce_app/shared/components/components.dart';
import 'package:ecommerce_app/shared/network/local/shared_prefrences.dart';
import 'package:ecommerce_app/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CoursesCubit extends Cubit<CoursesStates> {
  CoursesCubit() : super(CoursesStateInitial());

  static CoursesCubit get(context) => BlocProvider.of(context);

  List courses = [];

  getCourses() {
    emit(CoursesStateLoading());

    DioHelper.postData(
      path: 'lms/api/v1/courses',
      token: getToken(),
    ).then((value) {
      emit(CoursesStateSuccess());
      // print(value.data.toString());

      courses = value.data['result']['data'] as List;
    }).catchError((error) {
      emit(CoursesStateError(error));
    });
  }
}
