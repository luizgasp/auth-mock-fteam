import 'package:flutter_triple/flutter_triple.dart';

import '../../../../../../core/shared/exceptions/i_app_exception.dart';
import '../../../../../../core/shared/services/auth/dtos/login_with_email_dto.dart';
import '../../../../../../core/shared/services/overlay/i_overlay_service.dart';
import '../../domain/useCases/i_login_usecase.dart';

class LoginStore extends StreamStore<IAppException, bool> {
  final ILoginUsecase _loginUsecase;
  final IOverlayService _overlayService;

  LoginStore(this._loginUsecase, this._overlayService) : super(false);

  Future<void> loginWithEmail(LoginWithEmailDTO params) async {
    setLoading(true);

    final response = await _loginUsecase.loginWithEmail(params);

    response.fold(
      (left) {
        setError(left);
        _overlayService.showSnackBar(left.message);
      },
      (right) => update(true),
    );
  }
}
