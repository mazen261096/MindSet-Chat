import 'package:dartz/dartz.dart';

import '../../../core/utils/error_manager.dart';
import '../entities/user.dart';
import '../repository/base_user_repository.dart';


class LoginByEmailUseCase {
  final BaseUserRepository baseUserRepository;
  LoginByEmailUseCase(this.baseUserRepository);

  Future<Either<ErrorManager, AppUser>> execute({required String email, required String password}) async{
    return await baseUserRepository.loginByEmail(email: email,password: password);
  }

}