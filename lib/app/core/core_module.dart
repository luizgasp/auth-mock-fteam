import 'package:auth_mock_3/app/core/shared/services/database/firestore_database_service_imp.dart';
import 'package:auth_mock_3/app/core/shared/services/overlay/asuka_overlay_service_imp.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CoreModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => AsukaOverlayServiceImp(), export: true),
        Bind.factory(
          (i) => FirestoreDatabaseServiceImp(auth: FirebaseAuth.instance, fireStore: FirebaseFirestore.instance),
          export: true,
        )
      ];
}
