import 'package:conditional_builder/conditional_builder.dart';
import 'package:ecommerce_app/shared/colors/color_common.dart';
import 'package:ecommerce_app/shared/components/components.dart';
import 'package:ecommerce_app/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';
import 'package:ecommerce_app/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var search = SearchCubit.get(context).search;

          return ConditionalBuilder(
            condition: state is! SearchStateLoading,
            builder: (context) => ConditionalBuilder(
              condition: state is! SearchStateError,
              builder: (context) => Column(
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
                              onPressed: () {
                                SearchCubit.get(context)
                                    .getSearch(name: searchController.text);
                              },
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
                      padding: EdgeInsets.only(top: 20),
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) =>
                          buildCourseItem(search[index]),
                      separatorBuilder: (context, index) => SizedBox(
                        height: 20,
                      ),
                      itemCount: search.length,
                    ),
                  ),
                ],
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
