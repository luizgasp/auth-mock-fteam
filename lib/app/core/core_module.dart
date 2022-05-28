import 'package:auth_mock_3/app/core/shared/services/overlay/asuka_overlay_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CoreModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => AsukaOverlayServiceImp(), export: true),
      ];
}
