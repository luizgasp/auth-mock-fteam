import 'package:auth_mock_3/app/core/shared/dtos/create_user_params_dto.dart';
import 'package:auth_mock_3/app/core/shared/exceptions/implementations/database_exception.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:auth_mock_3/app/core/shared/services/database/i_database_service.dart';

class FirestoreDatabaseServiceImp implements IDatabaseService {
  final FirebaseAuth _auth;
  final FirebaseFirestore _fireStore;

  FirestoreDatabaseServiceImp({
    required FirebaseAuth auth,
    required FirebaseFirestore fireStore,
  })  : _auth = auth,
        _fireStore = fireStore;

  @override
  Future<void> createUserInDB(CreateUserParamsDTO params) async {
    try {
      await _fireStore.collection('users').doc(_auth.currentUser!.uid).set({
        "name": params.name,
        "email": params.email,
        "cpf": params.cpf,
        "rg": params.rg,
        "country": params.country,
      });
    } catch (error, stackTrace) {
      throw DatabaseException(message: "Create user in DB error", stackTrace: stackTrace);
    }
  }
}
