import 'package:dartz/dartz.dart';

import '../../../core/utils/error_manager.dart';
import '../repository/base_user_repository.dart';


class LogoutUseCase {
  final BaseUserRepository baseUserRepository ;
  const LogoutUseCase(this.baseUserRepository);

  Future<Either<ErrorManager, Null>> execute() async{
    return await baseUserRepository.logout();
  }

}