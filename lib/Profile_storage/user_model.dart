class UserModel {
  final String name;
  final String emailAddress;
  final String phonenumber;
  final String profilepic;
  // final String uid;

  UserModel(
      {required this.name,
      required this.emailAddress,
      required this.phonenumber,
      required this.profilepic,
      // required this.uid
      });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'emailAddress': emailAddress,
      'phonenumber': phonenumber,
      'profilepic': profilepic,
      // 'uid': uid
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        name: map['name'] ?? '',
        emailAddress: map['emailAddress'] ?? '',
        phonenumber: map['phonenumber'] ?? '',
        profilepic: map['profilepic'] ?? '',
        // uid: map['uid'] ?? ''
        );
  }
}
