import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliver_app_bar/notifier.dart';
import 'package:sliver_app_bar/view.dart';
void main() => runApp(
//  ChangeNotifierProvider(
//    builder: (context)=>DataModel(),
//    child:
MyApp() ,
//  )
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>BookingsDataChangeNotifier(),)
      ],
      child: Consumer<BookingsDataChangeNotifier>(
        builder: (context,data,_)
        {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: MyHomePage(title: 'Flutter Demo Home Page'),
          );
        },
      ),
    );
  }
}




