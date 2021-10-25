import 'package:catalog/Screen/CartScreen.dart';
import 'package:catalog/Screen/HomeScreen.dart';
import 'package:catalog/Screen/LoginScreen.dart';
import 'package:catalog/Widgets/themes.dart';
import 'package:catalog/core/store.dart';
import 'package:catalog/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {

  runApp(VxState(store:MyStore(),child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catalog',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MythemeData.lightTheme(context),
      darkTheme: MythemeData.darkTheme(context),
      initialRoute: Myroutes.myHomePage,
      routes:{
        '/':(context)=>LoginScreen(),
        Myroutes.myHomePage:(context)=>HomePage(),
        Myroutes.myCartScreen:(context)=>CartDetails()
      },

    );
  }
}
