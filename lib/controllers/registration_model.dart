



class RegModel{
  String? resturentName;
  String? ownerName;
  String? address;
  String? pincode;
  String? workHours;
  String? totalSeats;
  String?typeResturent;


  RegModel({this.resturentName,this.ownerName,this.address,this.pincode,this.totalSeats,this.typeResturent,this.workHours});
 
 RegModel.fromJson(Map<String,dynamic>json){

  resturentName = json["returentName"];
  ownerName  =json["ownername"];
  address=json["address"];
  pincode=json["pincode"];
  totalSeats =json["totalSeats"];
  typeResturent=json["typeResturent"];
  workHours=json["workHours"];
 
 }

 Map<String,dynamic> toJson(){
  final Map<String,dynamic> data =<String,dynamic>{};
  data["resturentName"]= resturentName;
  data["ownerName"]=ownerName;
  data["address"]=address;
  data["pincode"]=pincode;
  data["totalSeats"]=totalSeats;
 data["workHours"]=workHours;

  return  data;

 }


}




















