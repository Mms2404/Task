import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:task/core/constants/appColors.dart';
import 'package:task/core/routes/appRoutes.dart';

class AllCustomersScreen extends StatelessWidget {
  const AllCustomersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final query = FirebaseFirestore.instance
        .collection('users')
        .where('role', isEqualTo: 'customer');

    return Scaffold(
      backgroundColor: Appcolors.day,
      appBar: AppBar(
        backgroundColor: Appcolors.classic,
        leading: IconButton(
          onPressed: (){
            Navigator.pushReplacementNamed(context, AppRoutes.login);
          }, 
          icon: Icon(IconlyLight.arrow_left)),
        title:Text('All Customers', style: TextStyle(color: Appcolors.day),)),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: query.snapshots(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final docs = snap.data?.docs ?? [];
          if (docs.isEmpty) return const Center(child: Text('No customers found'));
          return ListView.separated(
            itemCount: docs.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (_, i) {
              final data = docs[i].data();
              final name = (data['name'] as String?)?.trim();
              final email = (data['email'] as String?)?.trim() ?? '';
              return Card(
                child: ListTile(
                  title: Text(name?.isNotEmpty == true ? name! : email),
                  subtitle: Text(email),
                ));
            },
          );
        },
      ),
    );
  }
}
