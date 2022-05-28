import 'package:auth_mock_3/app/core/shared/exceptions/implementations/database_exception.dart';
import 'package:auth_mock_3/app/core/shared/services/database/helpers/params/create_user_params.dart';
import 'package:auth_mock_3/app/core/shared/services/database/helpers/params/update_user_info_params.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:auth_mock_3/app/core/shared/services/database/i_database_service.dart';

// Como eu poderia fazer esse service melhor? Acredito que setei e atualizei as informações no firestore de uma forma errada
// porém não sei como melhorar direito isso.

// Supondo que ao invés de mandar um string no country eu queira mandar um Map<String, dynamic>, eu teria que alterar em
// vários arquivos certo?
class FirestoreDatabaseServiceImp implements IDatabaseService {
  final FirebaseAuth _auth;
  final FirebaseFirestore _fireStore;

  FirestoreDatabaseServiceImp({
    required FirebaseAuth auth,
    required FirebaseFirestore fireStore,
  })  : _auth = auth,
        _fireStore = fireStore;

  @override
  Future<void> createUserInDB(CreateUserParams params) async {
    try {
      await _fireStore.collection('users').doc(_auth.currentUser!.uid).set({
        "name": params.name,
        "email": params.email,
        "cpf": "",
        "rg": "",
        "country": "",
      });
    } catch (error, stackTrace) {
      throw DatabaseException(message: "Create user in DB error", stackTrace: stackTrace);
    }
  }

  @override
  Future<void> updateUserInfoInDB(UpdateUserInfoParams params) async {
    try {
      await _fireStore.collection('users').doc(_auth.currentUser!.uid).update({
        "cpf": params.cpf ?? "",
        "rg": params.rg ?? "",
        "country": params.country ?? "",
      });
    } catch (error, stackTrace) {
      throw DatabaseException(message: 'Update user info error', stackTrace: stackTrace);
    }
  }

  @override
  Future<Map<String, dynamic>?> getUserInfo() async {
    try {
      final user = await _fireStore.collection('users').doc(_auth.currentUser!.uid).get();
      return user.data();
    } catch (error, stackTrace) {
      throw DatabaseException(message: 'User not found on collection users', stackTrace: stackTrace);
    }
  }
}
