

class UserModel{
   final String? id;
   final String fullname;
   final String email;
   final int age;
   final String hometown;
   final String password;

  const UserModel({
    this.id,
    required this.email,
    required this.fullname,
    required this.age,
    required this.hometown,
    required this.password
  });

  toJson(){
    return {
      "FullName": fullname,
      "Email": email,
      "Age": age,
      "HomeTown":hometown,
      "Password":password
    };
  }


}