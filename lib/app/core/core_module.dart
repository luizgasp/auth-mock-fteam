import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'shared/services/auth/firebase_auth_service_imp.dart';
import 'shared/services/overlay/asuka_overlay_service_imp.dart';

class CoreModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => FirebaseAuth.instance, export: true),
        Bind.singleton((i) => AsukaOverlayServiceImp(), export: true),
        Bind.singleton((i) => FirebaseAuthServiceImp(i()), export: true),
      ];
}
