import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart' as modular;

import 'app_widget.dart';
import 'modules/home/home_module.dart';

class AppModule extends modular.MainModule {
  @override
  List<modular.Bind> get binds => [
        //modular.Bind((i) => AppController()),
      ];

  @override
  List<modular.ModularRouter> get routers => [
        modular.ModularRouter('/', module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static modular.Inject get to => modular.Inject<AppModule>.of();
}
