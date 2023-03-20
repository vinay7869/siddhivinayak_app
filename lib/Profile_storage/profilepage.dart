import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:siddhivinayak_app/Profile_storage/image_picker.dart';
import 'package:siddhivinayak_app/Profile_storage/profile_controller.dart';
import 'package:siddhivinayak_app/Profile_storage/user_model.dart';

class MyProfile extends ConsumerStatefulWidget {
  static const String routename = 'myprofile';
  const MyProfile({Key? key}) : super(key: key);

  @override
  ConsumerState<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends ConsumerState<MyProfile> {
  File? image;
  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getProfileData();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
  }

  void saveDataToFirebase() {
    String name = nameController.text.trim();
    String emailAddress = emailController.text.trim();
    String phonenumber = phoneController.text.toString().trim();
    if (name.isNotEmpty && emailAddress.isNotEmpty && phonenumber.isNotEmpty) {
      ref
          .read(profileControllerProvider)
          .saveDataToFirebase(name, context, emailAddress, phonenumber, image);
    }
  }

  void getProfileData() async {
//data fetch
    var userData = await FirebaseFirestore.instance.collection('users').get();
    UserModel user;
    // FirebaseStorage profilepic;
    user = UserModel.fromMap(userData.docs[0].data());

    nameController.text = user.name;
    emailController.text = user.emailAddress;
    phoneController.text = user.phonenumber;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My Profile", style: TextStyle(color: Colors.red)),
          elevation: 7,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.red,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: ListView(children: <Widget>[
            Stack(alignment: Alignment.center, children: <Widget>[
              image == null
                  ? const CircleAvatar(
                      backgroundImage: AssetImage('assets/pp.png'),
                      radius: 80,
                    )
                  : CircleAvatar(
                      backgroundImage: FileImage(image!),
                      radius: 80,
                    ),
              Positioned(
                  bottom: 2,
                  right: 100,
                  child: IconButton(
                    onPressed: () async {
                      image = await pickImageFromGallery(context);
                      setState(() {});
                    },
                    icon: const Icon(Icons.add_a_photo),
                    color: Colors.red,
                    iconSize: 37,
                  ))
            ]),
            const SizedBox(
              height: 60,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text('Personal Details',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.purpleAccent)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.red,
                      width: 2,
                    )),
                    labelText: 'Name'),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purpleAccent)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                  labelText: 'Enter Email id',
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: phoneController,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.purpleAccent)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 2)),
                  labelText: 'Enter Mobile No',
                ),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
              child: MaterialButton(
                  onPressed: saveDataToFirebase,
                  color: Colors.red,
                  height: 40,
                  minWidth: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  child: const Text(
                    'Done',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                  )),
            )
          ]),
        ));
  }
}
