import 'package:auth_mock_3/app/core/shared/exceptions/i_app_exception.dart';
import 'package:auth_mock_3/app/core/shared/services/overlay/i_overlay_service.dart';
import 'package:auth_mock_3/app/modules/auth/submodules/login/domain/dtos/login_params_dto.dart';
import 'package:auth_mock_3/app/modules/auth/submodules/login/domain/useCases/i_login_usecase.dart';
import 'package:flutter_triple/flutter_triple.dart';

class LoginStore extends StreamStore<IAppException, bool> {
  final ILoginUsecase _loginUsecase;
  final IOverlayService _overlayService;

  LoginStore(this._loginUsecase, this._overlayService) : super(false);

  Future<void> loginWithEmail(LoginWithEmailParamsDTO params) async {
    setLoading(true);

    final response = await _loginUsecase.loginWithEmail(params);

    response.fold(
      (l) {
        setError(l);
        _overlayService.showSnackBar(l.message);
      },
      (r) => true,
    );
  }
}
