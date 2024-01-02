
class ClientRegModel {
  final String restaurantName;
  final String owner;
  final String address;
  final String city;
  final String type;
  final int    seatCount;
  final int    workingHours;
  final String profileImage;
  final String pdf;
  final List    menuCards;

  ClientRegModel(
      {required this.restaurantName,
      required this.owner,
      required this.address,
      required this.city,
      required this.type,
      required this.seatCount,
      required this.workingHours,
      required this.profileImage,
      required this.pdf,
      required this.menuCards});
}

class Clientuser{
  final String username;
  final String password;
  final String email;

  Clientuser({
    required this.username,
    required this.password,
    required this.email,
});
 }


