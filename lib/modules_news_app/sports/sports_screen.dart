
import 'package:apiproject/components/components.dart';
import 'package:apiproject/layout/news_app/cubit/news_cubit.dart';
import 'package:apiproject/layout/news_app/cubit/news_stats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit , NewsStats>(
      listener: (context , state){},
      builder:  (context , state){
        var list = NewsCubit.get(context).sports;
        return
          ListView.separated(
              itemCount: list.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context , index)  => BuildArticalItems(list[index]),
              separatorBuilder:  (context , index) => Padding(padding: EdgeInsets.only(left: 20)  ,child: Divider(color: Colors.grey[300], height: 1,)),
              );
      },
    );
  }
}
