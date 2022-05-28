import 'package:auth_mock_3/app/modules/auth/domain/repositories/i_auth_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProfileController {
  final IAuthRepository authRepository;

  ProfileController(this.authRepository);

  Future<void> logout() async {
    await authRepository.logout();

    final currentUser = authRepository.getCurrentUser();

    return currentUser == null ? Modular.to.navigate('/auth/login') : null;
  }
}
