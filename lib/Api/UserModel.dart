

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
      "Password":password,
      "ProfilePhoto" : "https://firebasestorage.googleapis.com/v0/b/ol-exam-paper-hub.appspot.com/o/profile_avatar.jpg?alt=media&token=910c2450-d12d-4ce9-b461-df6c113908b8"
    };
  }


}