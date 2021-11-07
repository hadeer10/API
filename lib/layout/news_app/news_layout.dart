
import 'package:apiproject/layout/news_app/cubit/news_cubit.dart';
import 'package:apiproject/layout/news_app/cubit/news_stats.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()..getbusiness(),
      child: BlocConsumer<NewsCubit,NewsStats>(
        listener:(context , state){} ,
        builder:(context , state){
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('News App'),
              actions: [
                IconButton(onPressed: (){}, icon: Icon(Icons.search))
              ],
            ),
            body: cubit.screens[cubit.currentindex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentindex,
              onTap: (index){
                cubit.change(index);
              },
              items: cubit.bottomnavitems,
            ),
          );
        },
      ),
    );
  }
}
