import 'package:chat_mindest/auth_module/domain/entities/user.dart';
import 'package:chat_mindest/auth_module/presentation/controller/auth_events.dart';
import 'package:chat_mindest/chat_module/presentation/screens/home_screen/user_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../auth_module/data/models/user_model.dart';
import '../../../../auth_module/presentation/controller/auth_bloc.dart';
import '../../../../auth_module/presentation/controller/auth_states.dart';
import '../../../../core/network/firebase_constance.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/utils/enums.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List<AppUser>> fetchAppUsers() async {
    try {
      // Fetch all documents in the users collection
      QuerySnapshot snapshot = await FirebaseConstance.fireStore.collection(FirebaseConstance.usersCollection).get();

      // Map each document to an AppUserModel
      List<AppUser> users = snapshot.docs.map((doc) {
        return AppUserModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();

      return users;
    } catch (e) {
      throw Exception('Error fetching Users: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Users List',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              sl<AuthBloc>().add(LogOutEvent(context: context));
              // Your logout action here
            },
            icon: const Icon(Icons.logout),
            color: Colors.white,
          ),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF3A7BD5), Color(0xFF00D2FF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Color(0xFFE3FDFD)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder<List<AppUser>>(
            future: fetchAppUsers(),
            // Your future fetching logic here
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(
                  child: Text(
                    'Error: ${snapshot.error}',
                    style: const TextStyle(color: Colors.redAccent),
                  ),
                );
              } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                List<AppUser> appUsers = snapshot.data!;
                // Remove the current user
                return ListView.builder(
                  itemCount: appUsers.length,
                  itemBuilder: (context, index) {
                    return UserCard(appUser: appUsers[index]);
                  },
                );
              } else {
                return const Center(
                  child: Text(
                    'No Users available',
                    style: TextStyle(fontSize: 18),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
