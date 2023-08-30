class UserModel {
  String? uid;
  String? name;
  String? email;
  String? phone;
  String? password;

  UserModel({this.uid,this.name,this.email,this.phone,this.password});

  //receiving data from server
  factory UserModel.fromMap(map){
    return UserModel(
      uid: map['uid'],
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      password : map['password']
    );
  }

  //sending data to our server
Map<String, dynamic> toMap() {
    return {
      'uid' : uid,
      'name' : name,
      'email' : email,
      'phone' : phone,
      'password' : password,
    };
}
}