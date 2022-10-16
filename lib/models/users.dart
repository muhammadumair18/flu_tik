class Users{
  String name;
  String email;
  String profilephoto;
  String uid;

  Users({
    required this.name,
    required this.email,
    required this.profilephoto,
    required this.uid,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'email': this.email,
      'profilephoto': this.profilephoto,
      'uid': this.uid,
    };
  }

  factory Users.fromMap(Map<String, dynamic> map) {
    return Users(
      name: map['name'] as String,
      email: map['email'] as String,
      profilephoto: map['profilephoto'] as String,
      uid: map['uid'] as String,
    );
  }
}