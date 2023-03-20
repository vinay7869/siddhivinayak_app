import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final imageStorageRepositoryProvider = Provider(
  (ref) => ImageStorageRepository(firebaseStorage: FirebaseStorage.instance),
);

class ImageStorageRepository {
  FirebaseStorage firebaseStorage;

  ImageStorageRepository({required this.firebaseStorage});

  Future<String> getImage(
    String ref,
    File? file,
  ) async {
    UploadTask uploadTask = firebaseStorage.ref().child(ref).putFile(file!);
    TaskSnapshot snapshot = await uploadTask;
     String downloadURL = await snapshot.ref.getDownloadURL();
    return downloadURL;
  }
}
