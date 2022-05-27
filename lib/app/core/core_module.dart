import 'package:auth_mock_3/app/core/shared/services/overlay/implementations/asuka_overlay_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CoreModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => AsukaOverlayService(), export: true),
      ];
}
