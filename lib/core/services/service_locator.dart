
import 'package:chat_mindest/chat_module/domain/usecases/send_message_useCase.dart';
import 'package:chat_mindest/chat_module/presentation/controller/chat_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../auth_module/data/data_source/user_data_source.dart';
import '../../auth_module/data/repository/user_repository.dart';
import '../../auth_module/domain/repository/base_user_repository.dart';
import '../../auth_module/domain/usecases/login_by_email_usecase.dart';
import '../../auth_module/domain/usecases/logout_usecase.dart';
import '../../auth_module/domain/usecases/register_by_email_usecase.dart';
import '../../auth_module/presentation/controller/auth_bloc.dart';
import '../../chat_module/data/datasource/chat_remote_data_source.dart';
import '../../chat_module/data/repositories/chat_repository.dart';
import '../../chat_module/domain/repository/base_chat_repository.dart';

final sl =GetIt.instance;
 class ServiceLocator {

   static void initSl (){
     sl.registerLazySingleton<AuthBloc>(()=>AuthBloc(sl(),sl(),sl()));
     sl.registerLazySingleton<BaseUserDataSource>(()=>UserDataSource());
     sl.registerLazySingleton<BaseUserRepository>(()=>UserRepository(sl()));
     sl.registerLazySingleton<RegisterByEmailUseCase>(()=>RegisterByEmailUseCase(sl()));
     sl.registerLazySingleton<LoginByEmailUseCase>(()=>LoginByEmailUseCase(sl()));
     sl.registerLazySingleton<LogoutUseCase>(()=>LogoutUseCase(sl()));
     sl.registerLazySingleton<ChatBloc>(()=>ChatBloc(sl()));
     sl.registerLazySingleton<BaseChatDataSource>(()=>ChatRemoteDataSource());
     sl.registerLazySingleton<BaseChatRepository>(()=>ChatRepository(sl()));
     sl.registerLazySingleton<SendMessageUseCase>(()=>SendMessageUseCase(sl()));

   }
 }