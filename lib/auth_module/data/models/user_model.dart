


import '../../../core/utils/enums.dart';
import '../../domain/entities/user.dart';

class AppUserModel extends AppUser {
  const AppUserModel(
      {required super.id,
      required super.name,
        super.photoURL,
         super.token,
        super.accessToken,
        super.providerId,
        super.signInMethod,
        super.refreshToken,
        super.email,
        super.phoneNumber,
        super.emailVerified,
        super.isAnonymous,
      required super.userType});

  factory AppUserModel.fromJson(Map<String,dynamic> json){
    return AppUserModel(
        id: json['id'],
        name: json['name'] ,
        photoURL: json['photoURL'],
        token: json['token'],
        userType: UserType.fromJson(json['userType']) ,
      accessToken: json['accessToken'],
      providerId: json['providerId'],
      signInMethod: json['signInMethod'],
      refreshToken: json['refreshToken'],
      email: json['email'],
      emailVerified: json['emailVerified'],
      isAnonymous: json['isAnonymous'],
      phoneNumber: json['phoneNumber'],
    );
  }
}
