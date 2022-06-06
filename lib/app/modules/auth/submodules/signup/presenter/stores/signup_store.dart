import 'package:flutter_triple/flutter_triple.dart';

import '../../../../../../core/shared/exceptions/i_app_exception.dart';
import '../../../../../../core/shared/services/auth/dtos/signup_with_email_dto.dart';
import '../../../../../../core/shared/services/overlay/i_overlay_service.dart';
import '../../domain/usecases/signup/i_signup_usecase.dart';

class SignUpStore extends StreamStore<IAppException, bool> {
  final ISignUpUsecase _signUpUsecase;
  final IOverlayService _overlayService;

  SignUpStore(ISignUpUsecase signUpUsecase, IOverlayService overlayService)
      : _signUpUsecase = signUpUsecase,
        _overlayService = overlayService,
        super(false);

  Future<void> signUpWithEmail(SignUpWithEmailDTO params) async {
    setLoading(true);

    final response = await _signUpUsecase.signUpWithEmail(params);

    response.fold(
      (left) {
        setError(left);
        _overlayService.showSnackBar(left.message);
      },
      (right) => update(true),
    );
  }
}
