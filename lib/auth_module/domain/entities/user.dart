import '../../../core/utils/enums.dart';

class AppUser {
  final String id;
  final String name;
  final String? photoURL;
  final String? token;
  final String? accessToken;
  final String? providerId;
  final String? signInMethod;
  final String? refreshToken;
  final String? email;
  final String? phoneNumber;
  final bool? emailVerified;
  final bool? isAnonymous;
  final UserType userType;

  const AppUser({
    required this.id,
    required this.name,
    this.photoURL,
    this.token,
    this.accessToken,
    this.providerId,
    this.signInMethod,
    this.refreshToken,
    this.email,
    this.phoneNumber,
    this.emailVerified,
    this.isAnonymous,
    required this.userType,
  });
}
