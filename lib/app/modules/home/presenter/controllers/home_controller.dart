import 'package:auth_mock_3/app/modules/home/presenter/stores/logout_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeController {
  final LogoutStore _logoutStore;

  const HomeController(LogoutStore logoutStore) : _logoutStore = logoutStore;

  void _navigateToLogin() => Modular.to.navigate('/auth/login/');

  Future<void> handleLogout() async {
    await _logoutStore.logout();

    return _logoutStore.state ? _navigateToLogin() : null;
  }
}
