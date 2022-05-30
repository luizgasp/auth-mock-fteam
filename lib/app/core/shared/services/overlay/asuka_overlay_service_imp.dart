import 'package:flutter/material.dart';
import 'package:auth_mock_3/app/core/shared/services/overlay/i_overlay_service.dart';

import "package:asuka/asuka.dart" as asuka;

class AsukaOverlayServiceImp implements IOverlayService {
  @override
  void showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message, textAlign: TextAlign.center),
    );

    asuka.showSnackBar(snackBar);
  }
}
