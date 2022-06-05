import '../../../../../../core/shared/exceptions/i_app_exception.dart';
import '../../../../../../core/utils/either.dart';
import '../repositories/i_logout_repository.dart';
import 'i_logout_usecase.dart';

class LogoutUsecaseImp implements ILogoutUsecase {
  final ILogoutRepository _logoutRepository;

  const LogoutUsecaseImp(ILogoutRepository logoutRepository) : _logoutRepository = logoutRepository;

  @override
  Future<Either<IAppException, Unit>> call() async {
    return await _logoutRepository();
  }
}
