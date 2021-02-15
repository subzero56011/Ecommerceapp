import 'package:ecommerce_app/modules/search/cubit/states.dart';
import 'package:ecommerce_app/shared/components/components.dart';
import 'package:ecommerce_app/shared/network/local/shared_prefrences.dart';
import 'package:ecommerce_app/shared/network/remote/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchStateInitial());

  static SearchCubit get(context) => BlocProvider.of(context);

  List search = [];
  int totalPages = 0;
  int currentPage = 2;
  getSearch({name}) {
    emit(SearchStateLoading());

    DioHelper.postData(
      path: 'lms/api/v1/search',
      data: {
        'q': name,
        'type': 1,
      },
      query: {
        'page': 1,
      },
      token: getToken(),
    ).then((value) {
      emit(SearchStateSuccess());
      print(value.data.toString());

      search = value.data['result']['data'] as List;

      //currentPage ++;
      totalPages = value.data['result']['last_page'];
    }).catchError((error) {
      emit(SearchStateError(error));
      print(error.toString());
    });
  }

  getMoreSearch() {
    emit(SearchStateLoadingMore());

    DioHelper.postData(
      path: 'lms/api/v1/courses',
      query: {
        'page': currentPage,
      },
      token: getToken(),
    ).then((value) {
      emit(SearchStateSuccess());
      print(value.data.toString());

      search.addAll(value.data['result']['data'] as List);

      currentPage++;
    }).catchError((error) {
      emit(SearchStateError(error));
      print(error.toString());
    });
  }
}
