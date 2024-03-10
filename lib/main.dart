import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mandarin_client/pages/pages.dart';

import 'widgets/widgets.dart';

void main() {
  runApp(const MyApp());
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorColor = Colors.white 
    ..backgroundColor = const Color.fromARGB(255, 43, 43, 43)
    ..textColor = Colors.white
    ..successWidget = customSuccessWidget() 
    ..errorWidget = customErrorWidget();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mandarin 1',
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
      home: const HomePage(),
    );
  }
}
