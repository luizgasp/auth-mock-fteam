import '../../../../core/shared/services/auth/i_auth_service.dart';

class HomeController {
  final IAuthService _authService;

  const HomeController(IAuthService authService) : _authService = authService;

  Future<void> handleLogout() async {
    // await _authService.logout();

    // Modular.to.navigate('/auth/login/');
  }
}
