import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../core/network/firebase_constance.dart';

class FirebaseConstance {
  static var auth = FirebaseAuth.instance;
  static var fireStore = FirebaseFirestore.instance;
  static const String usersCollection = 'users';
}