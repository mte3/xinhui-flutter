import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:jh_im_sdk/jh_im_sdk.dart';
import 'package:nav_router/nav_router.dart';

void main() async {
  /// 确保初始化
  WidgetsFlutterBinding.ensureInitialized();

  /// app入口
  runApp(MyApp());

  /// 沉浸式状态栏
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }

  /// 自定义红屏页
  ErrorWidget.builder = (FlutterErrorDetails flutterErrorDetails) {
    debugPrint("flutterErrorDetails::" + flutterErrorDetails.toString());
    return new Center(child: new Text("网络开小差了"));
  };
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navGK,
      title: '信汇',
      theme: ThemeData(
        hintColor: Colors.grey.withOpacity(0.3),
        splashColor: Colors.transparent,
        scaffoldBackgroundColor: Color.fromRGBO(243, 243, 243, 1),
      ),
      home: JhImApp.getApp(),
    );
  }
}

