import 'package:flutter_triple/flutter_triple.dart';

import '../../../../../../core/shared/exceptions/i_app_exception.dart';
import '../../../../../../core/shared/services/overlay/i_overlay_service.dart';
import '../../domain/usecases/i_logout_usecase.dart';

class LogoutStore extends StreamStore<IAppException, bool> {
  final ILogoutUsecase _logoutUsecase;
  final IOverlayService _overlayService;

  LogoutStore(ILogoutUsecase logoutUsecase, IOverlayService overlayService)
      : _logoutUsecase = logoutUsecase,
        _overlayService = overlayService,
        super(false);

  Future<void> call() async {
    setLoading(true);

    final response = await _logoutUsecase();

    response.fold(
      (left) {
        setError(left);
        _overlayService.showSnackBar(left.message);
      },
      (right) => update(true),
    );
  }
}
