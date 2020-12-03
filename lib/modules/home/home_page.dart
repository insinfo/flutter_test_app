import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../shared/theme/style.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  BuildContext ctx;
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('pt_BR', null);
    Intl.defaultLocale = 'pt_BR';
    initHomePageState();
  }

  initHomePageState() async {
    print("initHomePageState:");

    //Firebase Message Configuração
    _firebaseMessaging.autoInitEnabled().then((bool enabled) => print(enabled));
    _firebaseMessaging.setAutoInitEnabled(true).then((f) {
      _firebaseMessaging.autoInitEnabled().then((bool enabled) => print(enabled));
    });
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        /*
        {google.c.sender.id: 335897738668, google.c.a.e: 1, aps: {alert: {title: ret, body: gf}, 
        mutable-content: 1}, gcm.n.e: 1, google.c.a.c_id: 4689678327598976679, google.c.a.udt: 0, 
        gcm.message_id: 1597437532586908, google.c.a.ts: 1597437532}
         */
        print("onMessage teste: $message");
        if (message?.containsKey('notification') == true) {
          if (message['notification'].containsKey('body')) {
            controller.scaffoldKey.currentState.showSnackBar(SnackBar(
              content: Text(message['notification']['body']),
              duration: Duration(seconds: 4),
            ));
          }
        }
        if (message?.containsKey('aps') == true) {
          if (message['aps'].containsKey('alert')) {
            if (message['aps']['alert'].containsKey('body')) {
              controller.scaffoldKey.currentState.showSnackBar(SnackBar(
                content: Text(message['aps']['alert']['body']),
                duration: Duration(seconds: 4),
              ));
            }
          }
        }
      },

      //onBackgroundMessage: Platform.isIOS ? myBackgroundMessageHandler : null,
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );
    //Future.delayed(Duration(seconds: 1), () {
    _firebaseMessaging.requestNotificationPermissions(
        IosNotificationSettings(sound: true, badge: true, alert: true, provisional: true));
    print("pedindo permisao");
    //});

    _firebaseMessaging.onIosSettingsRegistered.listen((IosNotificationSettings settings) {
      print("pediu permisao");
      print("Settings registered: $settings");
    });
    //se escreve em um topico para receber as notificações
    _firebaseMessaging.subscribeToTopic('riodasostrasapp');
    _firebaseMessaging.getToken().then((String token) {
      assert(token != null);
      setState(() {
        print("Push Messaging token: $token");
      });
    });
  }

  Size screenSize;
  @override
  Widget build(BuildContext context) {
    ctx = context;
    screenSize = MediaQuery.of(context).size;
    return Scaffold(
      key: controller.scaffoldKey,
      backgroundColor: scaffoldBackgroundColor,
      body: Container(
        child: SingleChildScrollView(
          child: Column(children: <Widget>[
            Container(
              height: 560,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    height: 150,
                    child: Container(
                      alignment: Alignment.center,
                      color: Colors.amber,
                      child: Text('Test App'),
                    ),
                  ),
                  Positioned(
                    top: 150, //280
                    height: screenSize.height,
                    width: screenSize.width,
                    child: WebView(
                      initialUrl: 'https://www.google.com.br/',
                    ),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
