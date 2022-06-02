import 'package:auth_mock_3/app/core/shared/services/auth/i_auth_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashController {
  final IAuthService _authService;

  SplashController(IAuthService authService) : _authService = authService;

  void get navigateToHome => Modular.to.navigate('/home/');
  void get navigateToLogin => Modular.to.navigate('/auth/login/');

  Future<void> initApp() async {
    await Future.delayed(const Duration(seconds: 2));

    final currentUser = _authService.getCurrentUser();

    return currentUser != null ? navigateToHome : navigateToLogin;
  }
}
