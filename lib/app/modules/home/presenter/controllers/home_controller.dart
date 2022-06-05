import 'package:flutter_modular/flutter_modular.dart';

import '../../../auth/submodules/logout/presenter/stores/logout_store.dart';

class HomeController {
  final LogoutStore _logoutStore;

  const HomeController(this._logoutStore);

  void _navigateToLogin() => Modular.to.navigate('/auth/login/');

  Future<void> handleLogout() async {
    await _logoutStore();

    return _logoutStore.state ? _navigateToLogin() : null;
  }
}
