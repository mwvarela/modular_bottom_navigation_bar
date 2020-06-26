import 'package:flutter_modular/flutter_modular.dart';

import 'pages/settings/settings_controller.dart';
import 'pages/profile/profile_controller.dart';
import 'tabs_controller.dart';
import 'tabs_page.dart';

class TabsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SettingsController()),
        Bind((i) => ProfileController()),
        Bind((i) => TabsController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => TabsPage()),
      ];

  static Inject get to => Inject<TabsModule>.of();
}
