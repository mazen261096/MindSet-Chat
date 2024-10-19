import 'package:dartz/dartz.dart';


import '../../../core/utils/error_manager.dart';
import '../entities/user.dart';
import '../repository/base_user_repository.dart';

class RegisterByEmailUseCase{
  final BaseUserRepository baseUserRepository;
   RegisterByEmailUseCase(this.baseUserRepository);

  Future<Either<ErrorManager,AppUser>> execute({required String email,required String password,required String name}) async{
    return await baseUserRepository.registerByEmail(email: email,password: password,name: name);
  }

}