
import 'package:equatable/equatable.dart';

import '../../../core/utils/enums.dart';
import '../../domain/entities/user.dart';

class AuthStates extends Equatable{
  final AppUser? appUser ;
  final RequestState appUserRequestState ;
  final String? appUserErrorMessage ;


   const AuthStates( {
     this.appUser,
this.appUserRequestState = RequestState.loaded,
     this.appUserErrorMessage
});

   AuthStates copyWith({
AppUser? appUser,
RequestState? appUserRequestState,
     String? appUserErrorMessage
}){
     return AuthStates(
       appUser: appUser??this.appUser,
       appUserRequestState: appUserRequestState??this.appUserRequestState,
         appUserErrorMessage: appUserErrorMessage??this.appUserErrorMessage
     );
   }


  @override
  // TODO: implement props
  List<Object?> get props => [appUser,appUserRequestState];
}