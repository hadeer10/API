import 'package:apiproject/layout/news_app/cubit/news_stats.dart';
import 'package:apiproject/modules_news_app/business/business_screen.dart';
import 'package:apiproject/modules_news_app/science/science_screen.dart';
import 'package:apiproject/modules_news_app/settingss/settingss.dart';
import 'package:apiproject/modules_news_app/sports/sports_screen.dart';
import 'package:apiproject/network/dio_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewsStats>{
  NewsCubit() : super(InitialNewsStats());
  static NewsCubit get(context) => BlocProvider.of(context);
  int currentindex =0;
  List <BottomNavigationBarItem> bottomnavitems =[
    BottomNavigationBarItem(
      icon: Icon(
        Icons.business,
      ),
      label: 'business',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,
      ),
      // ignore: deprecated_member_use
      label: 'sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      // ignore: deprecated_member_use
      label: 'science',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.settings,
      ),
      // ignore: deprecated_member_use
      label: 'settings',
    ),
  ];

  List <Widget> screens=[
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    SettingsScreen(),
  ];
  void change(int index){
    currentindex=index;
    if(index == 1)
      getsports();
    if(index == 2)
      getscience();
    emit(BottomNavNewsStats());
  }
  List <dynamic> Bussiness=[];
  void getbusiness(){
    emit(NewsLoadingBusinesState());
    DioHelper.getData(
        url:'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'business',
          'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
    }).then((value)  {
      Bussiness=value.data['articles'];
      print(Bussiness[0]['title']);
      emit(NewsGetBusinessSucessState());
    }).catchError((error){print(error.toString());
    emit(NewsGetBusinessErrorState(error.toString()));
    }
    );
  }

  List <dynamic> sports=[];
  void getsports(){
    emit(NewsLoadingSportsState());
    if (sports.length==0){
      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country': 'eg',
            'category': 'sports',
            'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
          }).then((value){
        sports=value.data['articles'];
        print(sports[0]['title']);
        emit(NewsGetSportsSucessState());
      }).catchError((error){print(error.toString());
      emit(NewsGetSportsErrorState(error.toString()));
      }
      );
    }else{
      emit(NewsGetSportsSucessState());
    }

  }

  List <dynamic> science=[];
  void getscience(){
    emit(NewsLoadingScienceState());

   if(science.length==0){
     DioHelper.getData(
         url: 'v2/top-headlines',
         query: {
           'country': 'eg',
           'category': 'science',
           'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
         }).then((value)  {
       science=value.data['articles'];
       print(science[0]['title']);
       emit(NewsGetScienceSucessState());
     }).catchError((error){print(error.toString());
     emit(NewsGetScienceErrorState(error.toString()));
     }
     );
   }else{
     emit(NewsGetScienceSucessState());
   }
  }
}