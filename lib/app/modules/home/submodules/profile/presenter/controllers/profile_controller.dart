import 'package:auth_mock_3/app/modules/auth/domain/repositories/i_auth_repository.dart';
import 'package:auth_mock_3/app/modules/home/submodules/profile/domain/repositories/i_profile_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProfileController {
  final IAuthRepository authRepository;
  final IProfileRepository profileRepository;

  ProfileController(this.authRepository, this.profileRepository);

  Future<void> getUserInfo() async {}

  Future<void> logout() async {
    await authRepository.logout();

    final currentUser = authRepository.getCurrentUser();

    return currentUser == null ? Modular.to.navigate('/auth/login') : null;
  }
}
