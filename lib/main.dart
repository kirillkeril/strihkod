import 'package:firebase_core/firebase_core.dart';
import 'package:json_theme/json_theme.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'dart:convert';

import 'app/routes/app_pages.dart';

Future<ThemeData> initializeThemeData(String fileName) async {
  final jsonData = await rootBundle.loadString('assets/themes/$fileName');
  final data = jsonDecode(jsonData);
  return ThemeDecoder.decodeThemeData(data, validate: true) ?? ThemeData();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    GetMaterialApp(
      theme: await initializeThemeData("light_theme.json"),
      title: "Strihkod",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
