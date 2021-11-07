import 'package:apiproject/layout/news_app/news_layout.dart';
import 'package:apiproject/network/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        scaffoldBackgroundColor: Colors.white,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepOrange,
      ),
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.black),
        // ignore: deprecated_member_use
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor:  Colors.white,
          statusBarBrightness: Brightness.dark,
        ),
        elevation: 0.0,
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
          color:  Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      ),
      home:Directionality(
        textDirection: TextDirection.ltr,
        child:  NewsLayout(),
      ),
    );
  }
}


