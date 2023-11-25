

class Usermodel{
  Usermodel(this.name, this.email, this.password);

  final String name;
  final String email;
  final String password;

  Map<String,dynamic > toMap(){
    return{
      'name':name,
      'email':email,
      'password':password,
    };
    }
  }

