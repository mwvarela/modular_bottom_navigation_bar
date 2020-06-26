import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';
import 'home_controller.dart';
import 'pages/page1/page1_controller.dart';
import 'pages/page1/page1_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => Page1Controller()),
        Bind((i) => HomeController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
        Router('/page1', child: (_, args) => Page1Page()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
