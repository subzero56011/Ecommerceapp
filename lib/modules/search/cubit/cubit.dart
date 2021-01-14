import 'package:ecommerce_app/modules/search/cubit/states.dart';
import 'package:ecommerce_app/shared/components/components.dart';
import 'package:ecommerce_app/shared/network/local/shared_prefrences.dart';
import 'package:ecommerce_app/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchStateInitial());

  static SearchCubit get(context) => BlocProvider.of(context);

  List search = [];

  getSearch({name}) {
    emit(SearchStateLoading());

    DioHelper.postData(
      path: 'lms/api/v1/search',
      token: getToken(),
      data: {
        'q': '$name',
        'type': '1',
      },
    ).then((value) {
      emit(SearchStateSuccess());
      // print(value.data.toString());

      search = value.data['result']['data'] as List;
      print(search);
      // print(search);
    }).catchError((error) {
      emit(SearchStateError(error));
    });
  }
}
