import 'package:ecommerce_app/modules/login/cubit/states.dart';
import 'package:ecommerce_app/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginStateInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  login({email, password}) {
    emit(LoginStateLoading());

    DioHelper.postData(
      path: 'lms/oauth/token',
      data: {
        'grant_type': 'password',
        'client_id': '1',
        'client_secret': 'UFj2FJ7X2jQfSjtptUIadua4rb0yeZjKvVaS55T9',
        'username': '$email',
        'password': '$password',
      },
    ).then((value) {
      // print(value.data);
      // print(value.statusCode.toString());

      emit(LoginStateSuccess(token: value.data['access_token']));
    }).catchError((e) {
      print(e.toString());
      emit(LoginStateError());
    });
  }
}
