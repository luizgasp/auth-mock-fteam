import 'package:auth_mock_3/app/core/shared/services/overlay/i_overlay_service.dart';

import "package:asuka/asuka.dart" as asuka;
import 'package:flutter/material.dart';

class AsukaOverlayService implements IOverlayService {
  @override
  void showSnackBar(String message) {
    //
    asuka.showSnackBar(SnackBar(content: Text(message, textAlign: TextAlign.center)));
  }
}
