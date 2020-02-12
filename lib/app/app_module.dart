import 'package:login_firebase/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:login_firebase/app/app_widget.dart';
import 'package:login_firebase/app/modules/home/home_module.dart';
import 'package:login_firebase/app/modules/login/login_module.dart';
import 'package:login_firebase/app/shared/auth/auth_controller.dart';
import 'package:login_firebase/app/shared/auth/repositories/auth_repository.dart';
import 'package:login_firebase/app/shared/auth/repositories/auth_repository_interface.dart';
import 'package:login_firebase/app/splash/splash_page.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind<IAuthRepository>((i) => AuthRepository()),
        Bind((i) => AuthController())
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => SplashPage()),
        Router('/login', module: LoginModule()),
        Router('/home', module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
