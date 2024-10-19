
import 'package:dartz/dartz.dart';

import '../../../core/utils/error_manager.dart';
import '../../domain/entities/user.dart';
import '../../domain/repository/base_user_repository.dart';
import '../data_source/user_data_source.dart';

class UserRepository implements BaseUserRepository{
final BaseUserDataSource baseUserDataSource;
UserRepository(this.baseUserDataSource);

  @override
  Future<Either<ErrorManager, AppUser>> loginByEmail({required String email, required String password}) async {

    try{
      final result = await baseUserDataSource.loginByEmail(email: email, password: password);

      return Right(result);
    }on ErrorManager catch(error){
      return Left(error);
    }
  }


  @override
  Future<Either<ErrorManager, AppUser>> registerByEmail({required String email, required String password,required String name}) async {
    // TODO: implement register
    try{
      final result = await baseUserDataSource.registerByEmail(email: email, password: password,name:name);

      return Right(result);
    }on ErrorManager catch(error){
      return Left(error);
    }
  }

  @override
  Future<Either<ErrorManager, Null>> logout() async {

    try{
      final result = await baseUserDataSource.logOut();

      return Right(result);
    }on ErrorManager catch(error){
      return Left(error);
    }
  }

}