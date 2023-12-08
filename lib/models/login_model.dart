class LoginModel{
  String? username;
  String? password;
  String? email;

  LoginModel({this.username,this.password,this.email});
 
 LoginModel.fromJson(Map<String,dynamic>json){
  username = json["username"];
  password =json["number"];
 }

 Map<String,dynamic> toJson(){
  final Map<String,dynamic> data =<String,dynamic>{};
  data["username"]= username;
  data["password"]=password;
  data["email"]=email;

  return  data;

 }


}