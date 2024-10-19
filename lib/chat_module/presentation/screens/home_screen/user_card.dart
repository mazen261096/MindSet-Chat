import 'package:flutter/material.dart';

import '../../../../auth_module/domain/entities/user.dart';
import '../../../../core/utils/routes_manager.dart';
class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.appUser});

  final AppUser appUser;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blueAccent,
          child: Text(
            appUser.name.substring(0, 1).toUpperCase(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        title: Text(
          appUser.name,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        subtitle: Text(
          appUser.email ?? 'No email available',
          style: TextStyle(
            color: Colors.grey[600],
          ),
        ),
        trailing: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF3A7BD5), Color(0xFF00D2FF)],
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Icon(
            Icons.chat,
            color: Colors.white,
          ),
          padding: const EdgeInsets.all(6),
        ),
        onTap: () {
          Routes.receiverUser=appUser;
          Navigator.pushNamed(context, Routes.chatRoute);
          // Navigate to chat
        },
      ),
    );
  }
}