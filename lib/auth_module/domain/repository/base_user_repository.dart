

import 'package:dartz/dartz.dart';
import '../../../core/utils/error_manager.dart';
import '../entities/user.dart';


abstract class BaseUserRepository {
  Future<Either<ErrorManager,AppUser>> registerByEmail({required String email,required String password,required String name});
  Future<Either<ErrorManager,AppUser>> loginByEmail({required String email,required String password});
  Future<Either<ErrorManager,Null>> logout();

}