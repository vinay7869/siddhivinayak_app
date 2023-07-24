import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../Profile Page/user_model.dart';

class DrawerItems extends StatefulWidget {
  const DrawerItems({super.key});

  @override
  State<DrawerItems> createState() => _DrawerItemsState();
}

class _DrawerItemsState extends State<DrawerItems> {
  late FirebaseFirestore firebaseFirestore;
  @override
  void initState() {
    super.initState();
    firebaseFirestore = FirebaseFirestore.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
            stream: firebaseFirestore.collection('users').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var userData = snapshot.data!.docs[index].data();
                  var user = UserModel.fromMap(userData);
                  return Column(children: [
                    UserAccountsDrawerHeader(
                        accountName: Text(user.name),
                        accountEmail: Text(user.emailAddress),
                        currentAccountPicture: CircleAvatar(
                          backgroundImage: NetworkImage(user.profilepic),
                        )),
                    ListTile(
                      title: Text('Hello  ${user.name}'),
                    )
                  ]);
                },
              );
            }));
  }
}
