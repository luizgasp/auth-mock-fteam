import 'package:auth_mock_3/app/modules/auth/domain/helpers/params/signup_params.dart';
import 'package:auth_mock_3/app/modules/auth/domain/helpers/params/login_params.dart';
import 'package:auth_mock_3/app/modules/auth/infra/datasources/i_auth_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthDatasource implements IAuthDatasource {
  final FirebaseAuth _auth;

  FirebaseAuthDatasource(this._auth);

  @override
  Future<UserCredential> login(LoginParams params) async {
    return await _auth.signInWithEmailAndPassword(email: params.email, password: params.password);
  }

  @override
  Future<UserCredential> signUp(SignUpParams params) async {
    return await _auth.createUserWithEmailAndPassword(email: params.email, password: params.password);
  }
}
