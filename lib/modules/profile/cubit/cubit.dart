import 'package:ecommerce_app/models/profile.dart';
import 'package:ecommerce_app/modules/profile/cubit/states.dart';
import 'package:ecommerce_app/shared/components/components.dart';
import 'package:ecommerce_app/shared/network/local/shared_prefrences.dart';
import 'package:ecommerce_app/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileStateInitial());

  static ProfileCubit get(context) => BlocProvider.of(context);

  Profile p;

  getProfile() {
    emit(ProfileStateLoading());

    DioHelper.postData(
      path: 'lms/api/v1/my-account',
      token: getToken(),
    ).then((value) {
      emit(ProfileStateSuccess());

      p = Profile(
          name: value.data['result']['full_name'],
          email: value.data['result']['email']);
    }).catchError((error) {
      emit(ProfileStateError(error));
      print(error);
    });
  }
}
