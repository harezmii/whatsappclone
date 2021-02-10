import 'package:flutter/material.dart';
import 'package:whatsapp/screen/home.dart';
import 'package:whatsapp/screen/settings.dart';

import 'package:camera/camera.dart';
import 'dart:async';

List<CameraDescription> cameras;

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        "/": (context) => Home(cameras),
        "/settings": (context) => Settings(),
      },
      debugShowCheckedModeBanner: false,
      title: "Whatsapp Clone",
      theme: ThemeData(
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Color(0xff25d366),
          ),
          appBarTheme: AppBarTheme(
            color: Color(0xff075E54),
          )),
    );
  }
}
