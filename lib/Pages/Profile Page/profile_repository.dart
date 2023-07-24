import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:siddhivinayak_app/Pages/Profile%20Page/image_picker.dart';
import 'package:siddhivinayak_app/Pages/Profile%20Page/image_provider.dart';
import 'package:siddhivinayak_app/Pages/Profile%20Page/user_model.dart';




final profileRepositoryProvider = Provider(
  (ref) => ProfileRepository(
      firebaseFirestore: FirebaseFirestore.instance,
      firebaseAuth: FirebaseAuth.instance),
);

class ProfileRepository {
  FirebaseFirestore firebaseFirestore;
  FirebaseAuth firebaseAuth;

  ProfileRepository(
      {required this.firebaseFirestore, required this.firebaseAuth});

  void saveDataToFirebase(
      {required String name,
      required BuildContext context,
      required String emailAddress,
      required String phonenumber,
      required File? profilepic,
      required ProviderRef ref}) async {
    String photoURL = '';
    String uid = 'user1';
    try {
      if (profilepic != null) {
        photoURL = await ref
            .read(imageStorageRepositoryProvider)
            .getImage('profilePics', profilepic);
      }
      var user = UserModel(
        name: name,
        emailAddress: emailAddress,
        phonenumber: phonenumber,
        profilepic: photoURL,
      );

      await firebaseFirestore.collection('users').doc(uid).set(user.toMap());
    } catch (e) {
      showSnackbar(context: context, content: e.toString());
    }
  }
}
