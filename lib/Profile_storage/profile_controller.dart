import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:siddhivinayak_app/Profile_storage/profile_repository.dart';

final profileControllerProvider = Provider(
  (ref) {
    final profileRepository = ref.watch(profileRepositoryProvider);
    return ProfileController(profileRepository: profileRepository, ref: ref);
  },
);

class ProfileController {
  ProfileRepository profileRepository;
  ProviderRef ref;

  ProfileController({required this.profileRepository, required this.ref});

  void saveDataToFirebase(String name, BuildContext context,
      String emailAddress, String phonenumber, File? profilepic) {
    profileRepository.saveDataToFirebase(
        name: name,
        context: context,
        emailAddress: emailAddress,
        phonenumber: phonenumber,
        profilepic: profilepic,
        ref: ref);
  }
}
