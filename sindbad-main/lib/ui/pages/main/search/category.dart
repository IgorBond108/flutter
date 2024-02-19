import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sindbad/bloc/category/bloc.dart';
import 'package:sindbad/bloc/category/state.dart';
import 'package:sindbad/utils/color.dart';
import 'package:sindbad/utils/string.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
          decoration: BoxDecoration(
              border: Border.all(color: MColor.grey),
              borderRadius: BorderRadius.circular(8)),
          child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Найти на Sindbad',
                  hintStyle: TextStyle(color: MColor.grey),
                  contentPadding: EdgeInsets.zero,
                  isDense: true,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: Image.asset(
                      'assets/ic_search2.png',
                      height: 20,
                      width: 20,
                    ),
                  ),
                  prefixIconConstraints: BoxConstraints())),
        ),
        BlocBuilder<CategoryBloc, CategoryState>(
          builder: (context, state) {
            if (state is CategoryLoadedState){
            return Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.categoryResponceMoodel.results?.length,
                    itemBuilder: (cntx, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.fromLTRB(20, index == 0 ? 0 : 15, 20, 4),
                            child: Text(state.categoryResponceMoodel.results?[index].title??''),
                          ),
                          Container(
                            height: 100,
                            width: double.infinity,
                            child: ListView.builder(
                                padding: EdgeInsets.only(left: 20),
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: state.categoryResponceMoodel.results?[index].children?.length,
                                itemBuilder: (cntx2, i) {
                                  return Stack(
                                    children: [
                                      Container(
                                          height: 100,
                                          margin: EdgeInsets.all(4),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              color: Colors.black),
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              child: Image.network(
                                                MString.fakeImageLink,
                                                width: 100,
                                                opacity:
                                                    AlwaysStoppedAnimation(0.8),
                                                fit: BoxFit.cover,
                                              ))),
                                      Positioned(
                                        width: 100,
                                          bottom: 6,
                                          left: 10,
                                          child: Text(
                                            '${state.categoryResponceMoodel.results?[index].children?[i].title}',
                                            maxLines: 2,
                                            style: TextStyle(color: Colors.white, fontSize: 13),
                                          ))
                                    ],
                                  );
                                }),
                          ),
                        ],
                      );
                    }));} else{
                      return Center(child: SizedBox(width: 40, height: 40, child: CircularProgressIndicator(),),);
                    }
          }
        )
      ],
    );
  }
}
