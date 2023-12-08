
class RegModel {
  String? resturentName;
  String? ownerName;
  String? address;
  String? pincode;
  String? workHours;
  String? totalSeats;
  String? typeResturent;
  List<String>? imageUrls;

  RegModel({
    this.resturentName,
    this.ownerName,
    this.address,
    this.pincode,
    this.totalSeats,
    this.typeResturent,
    this.workHours,
    required this.imageUrls, 
    required String documentPDFUrl, required String imageUrl,
  });

  RegModel.fromJson(Map<String, dynamic> json) {
    resturentName = json["resturentName"];
    ownerName = json["ownerName"];
    address = json["address"];
    pincode = json["pincode"];
    totalSeats = json["totalSeats"];
    typeResturent = json["typeResturent"];
    workHours = json["workHours"];
    imageUrls = List<String>.from(json["imageUrls"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["resturentName"] = resturentName;
    data["ownerName"] = ownerName;
    data["address"] = address;
    data["pincode"] = pincode;
    data["totalSeats"] = totalSeats;
    data["workHours"] = workHours;
    data["typeResturent"] = typeResturent;
    data["imageUrls"] = imageUrls;
    return data;
  }
}


















