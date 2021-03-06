import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/app_widget.dart';
import 'package:flutter_test_app/shared/app_config.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    HttpClient client = super.createHttpClient(context); //<<--- notice 'super'
    client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    client.userAgent = AppConfig.userAgent;
    return client;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(AppWidget());
}
