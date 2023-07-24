class UserModel {
  final String name;
  final String emailAddress;
  final String phonenumber;
  final String profilepic;

  UserModel({
    required this.name,
    required this.emailAddress,
    required this.phonenumber,
    required this.profilepic,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'emailAddress': emailAddress,
      'phonenumber': phonenumber,
      'profilepic': profilepic,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] ?? '',
      emailAddress: map['emailAddress'] ?? '',
      phonenumber: map['phonenumber'] ?? '',
      profilepic: map['profilepic'] ?? '',
    );
  }
}
