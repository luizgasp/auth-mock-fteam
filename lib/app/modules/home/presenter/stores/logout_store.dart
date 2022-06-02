import 'package:auth_mock_3/app/core/shared/exceptions/i_app_exception.dart';
import 'package:auth_mock_3/app/core/shared/services/overlay/i_overlay_service.dart';
import 'package:auth_mock_3/app/modules/auth/submodules/login/domain/usecases/i_login_usecase.dart';
import 'package:flutter_triple/flutter_triple.dart';

class LogoutStore extends StreamStore<IAppException, bool> {
  final ILoginUsecase _loginUsecase;
  final IOverlayService _overlayService;

  LogoutStore(ILoginUsecase loginUsecase, IOverlayService overlayService)
      : _loginUsecase = loginUsecase,
        _overlayService = overlayService,
        super(false);

  Future<void> logout() async {
    setLoading(true);

    final response = await _loginUsecase.logout();

    response.fold(
      (left) {
        setError(left);
        _overlayService.showSnackBar(left.message);
      },
      (right) => update(true),
    );
  }
}
