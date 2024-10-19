




import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../core/network/firebase_constance.dart';
import '../../../core/utils/enums.dart';
import '../../../core/utils/error_manager.dart';
import '../models/user_model.dart';
abstract class BaseUserDataSource {
  Future<AppUserModel> registerByEmail({required String email,required String password,required String name});
  Future<AppUserModel> loginByEmail({required String email,required String password});
  Future<Null> logOut();
}

class UserDataSource implements BaseUserDataSource{

  @override
  Future<AppUserModel> registerByEmail({required String email, required String password,required String name}) async{
try{

  UserCredential userCredential = await FirebaseConstance.auth.createUserWithEmailAndPassword(email: email, password: password);


  Map<String,dynamic> userData = {
  'id':userCredential.user!.uid,
  'userType' : 'user',
  'name':name,
  'photoURL':userCredential.user!.photoURL,
  'token':userCredential.credential?.token,
  'accessToken':userCredential.credential?.accessToken,
  'providerId':userCredential.credential?.providerId,
  'signInMethod':userCredential.credential?.signInMethod,
  'refreshToken':userCredential.user!.refreshToken,
  'email':userCredential.user!.email,
  'emailVerified':userCredential.user!.emailVerified,
  'isAnonymous':userCredential.user!.isAnonymous,
  'phoneNumber':userCredential.user!.phoneNumber,
};

  await FirebaseConstance.fireStore.collection(FirebaseConstance.usersCollection).doc(userCredential.user!.uid).set(userData,SetOptions(merge: true));

  return  AppUserModel.fromJson(userData);

}catch(error){
  throw ErrorManager(error.toString());
}
  }


  @override
  Future<AppUserModel> loginByEmail({required String email, required String password}) async {
    try{

      UserCredential userCredential=await  FirebaseConstance.auth.signInWithEmailAndPassword(email: email, password: password);
      DocumentSnapshot<Map<String, dynamic>> document = await FirebaseConstance.fireStore.collection(FirebaseConstance.usersCollection).doc(userCredential.user!.uid).get();
      return AppUserModel.fromJson(document.data()!);

    }on FirebaseAuthException catch (error){

      throw ErrorManager(error.toString());

    }
  }

  @override
  Future<Null> logOut() async {
   try{
     await FirebaseConstance.auth.signOut();
     return null;
   }catch (error) {
     throw ErrorManager(error.toString());
   }
  }

}