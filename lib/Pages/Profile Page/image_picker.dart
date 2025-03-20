import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Future<File?> pickImageFromGallery(BuildContext context) async {
  File? image;
  try {
    final pickedImage = 
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      image = File(pickedImage.path);
    }
  } catch (e) {
    // ignore: use_build_context_synchronously
    showSnackbar(context: context, content: e.toString());
  }
  return image;
}

void showSnackbar({required BuildContext context,required String content}) {
 ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('content'))); 
}
