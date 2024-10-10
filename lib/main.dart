import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/screens/home_page_screen.dart';

void main() {
  runApp(DevicePreview(
    builder: (context) => const NewsApp(),
  ));
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, deviceInfo) {
          return const MaterialApp(
              builder: DevicePreview.appBuilder,
              debugShowCheckedModeBanner: false,
              home: HomePageScreen());
        });
  }
}
