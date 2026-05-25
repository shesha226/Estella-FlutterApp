import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Future<DocumentSnapshot> _getUserDetails() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .limit(1)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      return querySnapshot.docs.first;
    } else {
      throw Exception("No users found");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'ESTELLA',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'Serif',
          ),
        ),
        actions: [
          const Icon(Icons.notifications_none, color: Colors.black),
          const SizedBox(width: 15),
          const CircleAvatar(
            radius: 18,
            backgroundColor: Color(0xFFE0E0FF),
            child: Icon(Icons.person, size: 18, color: Colors.black54),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: _getUserDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(color: Color(0xFFEB0000)),
            );
          }

          if (snapshot.hasError ||
              !snapshot.hasData ||
              !snapshot.data!.exists) {
            return const Center(
              child: Text(
                "Failed to load user details from Firebase.",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            );
          }

          Map<String, dynamic> userData =
              snapshot.data!.data() as Map<String, dynamic>;

          String name = (userData['fullName'] ?? 'ESTELLA USER')
              .toString()
              .toUpperCase();
          String email = (userData['email'] ?? 'Not Provided').toString();
          String profileImg = (userData['profilePic'] ?? '').toString();

          String fullDate = (userData['createdAt'] ?? 'MAY 2026').toString();
          String joined = fullDate.contains('T')
              ? fullDate.split('T')[0]
              : fullDate;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title Section
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    'MY PROFILE',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Serif',
                    ),
                  ),
                ),
                const Divider(indent: 20, endIndent: 20, color: Colors.black26),
                const SizedBox(height: 20),

                // Profile Avatar Section
                Center(
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.grey[200]!,
                            width: 3,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 55,
                          backgroundColor: const Color(0xFFF5F5F5),
                          backgroundImage: profileImg.startsWith('http')
                              ? NetworkImage(profileImg)
                              : null,
                          child: profileImg.isEmpty
                              ? const Icon(
                                  Icons.person,
                                  size: 55,
                                  color: Colors.black38,
                                )
                              : null,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 16,
                          backgroundColor: const Color(0xFFEB0000),
                          child: const Icon(
                            Icons.camera_alt,
                            size: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),

                // User Name
                Center(
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Details List
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildDetailItem("FULL NAME", name),
                      _buildDetailItem("EMAIL ADDRESS", email),
                      _buildDetailItem("JOINED DATE", joined),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Action Buttons
                const Divider(indent: 20, endIndent: 20, color: Colors.black12),
                _buildRowButton("MY ORDERS", Icons.shopping_bag_outlined),
                _buildRowButton("SETTINGS", Icons.settings_outlined),
                _buildRowButton("LOG OUT", Icons.logout, isLogout: true),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 11,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          const Divider(color: Colors.black12, height: 1),
        ],
      ),
    );
  }

  Widget _buildRowButton(String title, IconData icon, {bool isLogout = false}) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 25, vertical: 2),
      leading: Icon(
        icon,
        color: isLogout ? const Color(0xFFEB0000) : Colors.black87,
        size: 22,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: isLogout ? const Color(0xFFEB0000) : Colors.black87,
          letterSpacing: 0.5,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 14,
        color: isLogout ? const Color(0xFFEB0000) : Colors.black38,
      ),
      onTap: () {},
    );
  }
}
